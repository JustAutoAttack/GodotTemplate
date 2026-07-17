## Strict bus enforcing 1-to-1 command handling with mandatory registration
class_name CommandBus 
extends EventBus

# ===
# Built-In
# ===

func _emit_policy(event: Event) -> void:
	var type = event.get_script()
	
	if (
		not _subscribers.has(type) or 
		_subscribers[type].is_empty()
	):
		
		SystemLogger.log_message(
			"No handler registered for {0}! Commands must be handled.".format([type.resource_name]),
			Enums.LogLevel.ERROR
		)
		return
		
	var handler: Callable = _subscribers[type][0]
	if handler.is_valid():
		handler.call(event)
	else:
		_subscribers[type].clear()

# ===
# Public
# ===

## Registers a [Callable] as the unique handler for a command type.
## [br][br]
## - [param type] is the GDScript class reference of the command to handle.
## [br][br]
## - [param callback] is the function to execute when the command is emitted.
func register_handler(
	type: GDScript, 
	callback: Callable
) -> void:
	if _subscribers.has(type) and not _subscribers[type].is_empty():
		SystemLogger.log_message(
			"Overwriting existing handler for {0}".format([type.resource_name]), 
			Enums.LogLevel.WARN
		)
	_subscribers[type] = [callback]
