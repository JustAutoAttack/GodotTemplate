class_name WorldContextProvider
extends ContextProvider

var context: WorldContextData

# ===
# Built-In
# ===

func _init(
	p_context: WorldContextData
) -> void:
	context = p_context

# ===
# Public
# ===

func reset() -> void:
	context.reset()

func set_time(value: float) -> void:
	context.time = value

func set_cpu_time(value: float) -> void:
	context.cpu_time = value
