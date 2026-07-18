## Base class for all event packets
class_name Event 
extends RefCounted

## Returns the class name of the event for logging
func get_event_name() -> String:
	return get_script().get_global_name()
