class_name MainSceneController
extends Node

var current_scene: Node

# ===
# Built-In
# ===

func _ready() -> void:
	CommandBus.subscribe(Commands.LoadBootsplash, _handle_main_load_bootsplash)
	CommandBus.subscribe(Commands.LoadGame, _handle_main_load_game)

func _exit_tree() -> void:
	CommandBus.unsubscribe(Commands.LoadBootsplash, _handle_main_load_bootsplash)
	CommandBus.unsubscribe(Commands.LoadGame, _handle_main_load_game)

# ===
# Events
# ===

func _handle_main_load_bootsplash(_event: Commands.LoadBootsplash) -> void:
	var bootsplash: Bootsplash = AssetProvider.get_bootsplash_scene()
	
	if current_scene:
		current_scene.queue_free()
		current_scene = null

	current_scene = bootsplash
	add_child(current_scene)

func _handle_main_load_game(_event: Commands.LoadGame) -> void:
	var game: Game = AssetProvider.get_game_scene()
	
	if current_scene:
		current_scene.queue_free()
		current_scene = null

	current_scene = game
	add_child(current_scene)
