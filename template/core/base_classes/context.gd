class_name Context
extends RefCounted

# ===
# Abstract
# ===

func reset() -> void:
	assert(
		false, 
		"Reset method not implemented"
	)

# ===
# Concrete
# ===

func _authorize_write() -> bool:
	var stack: Array = get_stack()
	if stack.size() < 3: return false

	var caller_frame: Variant = stack[2]
	var caller: Variant = caller_frame.get("object")
	
	# Default
	if (
		caller is ContextProvider or 
		caller == self
	):
		return true
	
	push_warning(
		"Caller IS NOT ContextProvider or Self: {0}"
		.format([caller.name])
	)
	
	# Fallback: If caller is null, check the script resource path
	var source_path: Variant = caller_frame.get("source")
	if (
		source_path is String and 
		source_path.contains("/providers/")
	):
		return true

	push_error(
		"Unauthorized write by {0}"
		.format([caller])
	)
	return false
