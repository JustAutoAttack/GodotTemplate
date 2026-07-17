## Base transport layer for event-driven communication with re-entrant queuing.
class_name EventBus 
extends RefCounted

## Mapping of event GDScript types to their list of subscriber Callables.
var _subscribers: Dictionary[GDScript, Array] = {}

## Queue holding events triggered during an existing emission cycle.
var _event_queue: Array[Object] = []

## Flag indicating if an emission cycle is currently active.
var _is_emitting: bool = false

## Utility property to check if there are pending events in the queue.
var _can_emit: bool:
	get: return not _event_queue.is_empty()

# ===
# Public
# ===

## Registers a [Callable] to be executed when the specified event type is emitted.
## [br][br]
## - [param type] is the GDScript class reference of the event to subscribe to.
## [br][br]
## - [param callback] is the function to execute when the event is emitted.
func subscribe(
	type: GDScript, 
	callback: Callable
) -> void:
	if not _subscribers.has(type): 
		_subscribers[type] = []
	if not _subscribers[type].has(callback): 
		_subscribers[type].append(callback)

## Removes a specific [Callable] subscription for the given event type.
## [br][br]
## - [param type] is the GDScript class reference of the event to unsubscribe from.
## [br][br]
## - [param callback] is the specific function to remove.
func unsubscribe(
	type: GDScript, 
	callback: Callable
) -> void:
	if _subscribers.has(type): 
		_subscribers[type].erase(callback)

## Dispatches an event to its subscribers. If an emission is already in progress, 
## the event is queued to ensure sequential processing and prevent recursion issues.
## [br][br]
## - [param event] is the event object to emit.
func emit(event: Event) -> void:
	if _is_emitting:
		_event_queue.append(event)
		return
	
	_is_emitting = true
	_emit_policy(event)
	_is_emitting = false
	
	while _can_emit:
		emit(_event_queue.pop_front())

# ===
# Private
# ===

## Defines the delivery logic for specific event types. 
## Must be implemented by child classes to enforce bus-specific policies.
## [br][br]
## - [param _event] is the event object being processed.
func _emit_policy(_event: Event) -> void:
	assert(
		false, 
        "Must implement _emit_policy in child bus"
	)
