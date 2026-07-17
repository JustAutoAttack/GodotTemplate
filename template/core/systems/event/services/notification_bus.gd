## Broadcast bus supporting many-to-many notification dispatching
class_name NotificationBus 
extends EventBus

# ===
# Built-In
# ===

func _emit_policy(event: Event) -> void:
	var type = event.get_script()
	if _subscribers.has(type):
		var current_subscribers = _subscribers[type].duplicate()
		for callback in current_subscribers:
			if callback.is_valid():
				callback.call(event)
			else:
				_subscribers[type].erase(callback)
