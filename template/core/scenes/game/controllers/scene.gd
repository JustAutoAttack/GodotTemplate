class_name GameSceneController
extends SceneController

# ===
# Built-In
# ===

func _subscribe_events() -> void:
	EventSystem.subscribe_to_command(Commands.LoadTitle, _handle_load_title_scene, self)
	EventSystem.subscribe_to_command(Commands.LoadWorld, _handle_load_world_scene, self)

# ===
# Events
# ===

func _handle_load_title_scene(_event: Commands.LoadTitle) -> void:
	_replace_current(AssetProvider.get_title_scene())

func _handle_load_world_scene(_event: Commands.LoadWorld) -> void:
	_replace_current(AssetProvider.get_world_scene())
