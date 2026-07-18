## Managed service to track and clean up node-specific event subscriptions
class_name EventSubscriber
extends RefCounted

static var _active_subscriptions: Array[EventSubscription] = []

static func subscribe(
	event_bus: EventBus, 
	type: GDScript, 
	callback: Callable,
	owner: Object
) -> void:
	if not is_instance_valid(owner):
		LogSystem.log_message(
			"Cannot subscribe an invalid owner.",
			LogEnums.LogLevel.ERROR
		)
		return
	
	event_bus.subscribe(
		type, 
		callback
	)
	_active_subscriptions.append(EventSubscription.new(
		event_bus,
		type,
		callback,
		owner
	))

static func unsubscribe_all(bus: EventBus) -> void:
	for subscription: EventSubscription in _active_subscriptions:
		if subscription.bus == bus:
			bus.unsubscribe(
				subscription.type, 
				subscription.callback
			)
	
	# Filter out the cleared subscriptions
	_active_subscriptions = _active_subscriptions.filter(
		func(subscription: EventSubscription): 
			return subscription.bus != bus
	)

static func unsubscribe_all_for_owner(owner: Object) -> void:
	var remaining: Array[EventSubscription] = []
	
	for subscription: EventSubscription in _active_subscriptions:
		if subscription.owner == owner:
			subscription.bus.unsubscribe(
				subscription.type, 
				subscription.callback
			)
		else:
			remaining.append(subscription)
	
	_active_subscriptions = remaining

static func get_active_count() -> int:
	return _active_subscriptions.size()
