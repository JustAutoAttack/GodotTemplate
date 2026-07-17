class_name EventSubscription
extends RefCounted

var bus: EventBus
var type: GDScript
var callback: Callable
var owner: Object

func _init(
	p_bus: EventBus,
	p_type: GDScript,
	p_callback: Callable,
	p_owner: Object
) -> void:
	bus = p_bus
	type = p_type
	callback = p_callback
	owner = p_owner
