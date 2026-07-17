## Utility class for centralized application logging.
class_name SystemLogger
extends RefCounted

# TODO: Move stack logic to a StackService

## Logs a message to the console with a timestamp and the caller's class name 
## retrieved via call stack introspection.
## [br][br]
## - [param message] is the text content to log.
## [br][br]
## - [param level] is the severity level (using [code]Enums.LogLevel[/code]).
static func log_message(
	message: String, 
	level: Enums.LogLevel
) -> void:
	var time: String = Time.get_time_string_from_system()
	var level_str: String = Enums.LogLevel.keys()[level]
	var tag: String = _get_caller_tag()
		
	var output: String = "[{0}] [{1}] [{2}]: {3}".format([time, level_str, tag, message])
	
	match level:
		Enums.LogLevel.DEBUG: print_debug(output)
		Enums.LogLevel.INFO: print(output)
		Enums.LogLevel.WARN: push_warning(output)
		Enums.LogLevel.ERROR: push_error(output)

## Retrieves the class name or type of the object that invoked the log method.
## [br][br]
## Returns "Unknown" if the caller cannot be resolved from the stack.
static func _get_caller_tag() -> String:
	var stack = get_stack()
	# Frame 0: get_stack()
	# Frame 1: _get_caller_tag()
	# Frame 2: log_message()
	# Frame 3: The actual caller
	if stack.size() < 4:
		return "Unknown"
		
	var caller = stack[3].get("object")
	if not caller:
		return "Unknown"
		
	if caller.get_script():
		var script_name = caller.get_script().get_global_name()
		if not script_name.is_empty():
			return script_name
			
	return caller.get_class()
