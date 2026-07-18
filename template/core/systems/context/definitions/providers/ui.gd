class_name UIContextProvider
extends ContextProvider

var context: UIContextData

# ===
# Built-In
# ===

func _init(
	p_context: UIContextData
) -> void:
	context = p_context

# ===
# Public
# ===

func toggle_menu(
	menu_type: Enums.MenuType, 
	is_visible: bool
) -> void:
	if is_visible:
		if not context.open_menus.has(menu_type):
			context.open_menus.append(menu_type)
	else:
		context.open_menus.erase(menu_type)
	
	context.open_menus_updated.emit(menu_type)

func set_open_menus(
	value: Array[Enums.MenuType]
) -> void:
	context.open_menus = value

func is_menu_open(
	menu_type: Enums.MenuType
) -> bool:
	return (menu_type in context.open_menus)

func set_hud_visible(value: bool) -> void:
	context.is_hud_visible = value

func set_loading(value: bool) -> void:
	context.is_loading = value

func set_saving(value: bool) -> void:
	context.is_saving = value
