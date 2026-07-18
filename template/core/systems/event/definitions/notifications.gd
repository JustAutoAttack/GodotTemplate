class_name Notifications
extends RefCounted

# ===
# Misc
# ===

# --- Pause ---
class Paused extends Notification: pass
class Resumed extends Notification: pass

# --- Save/Load ---
class LoadingStarted extends Notification: pass
class LoadingStopped extends Notification: pass
class SavingStarted extends Notification: pass
class SavingStopped extends Notification: pass
class GameSaved extends Notification: pass
class GameSaveLoaded extends Notification: 
	
	var data: GameSaveData
	
	func _init(
		p_data: GameSaveData
	) -> void:
		data = p_data
class SettingsSaved extends Notification: pass

# ===
# Scene
# ===

# --- Main ---
class MainLoaded extends Notification: pass
class BootsplashLoaded extends Notification: pass
class GameLoaded extends Notification: pass

# --- Game ---
class TitleLoaded extends Notification: pass
class WorldLoaded extends Notification: pass

# ===
# Audio
# ===

# --- Music ---
class MusicPauseUpdated extends Notification:
	
	var is_paused: bool
	
	func _init(
		p_is_paused: bool
	) -> void:
		is_paused = p_is_paused
class CurrentPlaybackTimeUpdated extends Notification:
	
	var value: int
	
	func _init(
		p_value: int
	) -> void:
		value = p_value
class CurrentMusicUpdated extends Notification:
	
	var song_data: SongData
	
	func _init(
		p_song_data: SongData
	) -> void:
		song_data = p_song_data

# ===
# UI
# ===

class MainMenuActioned extends Notification:
	
	var action: Enums.MainMenuAction
	
	func _init(
		p_action: Enums.MainMenuAction
	) -> void:
		action = p_action
class SettingsMenuActioned extends Notification:
	
	var action: Enums.SettingsMenuAction
	
	func _init(
		p_action: Enums.SettingsMenuAction
	) -> void:
		action = p_action
class PauseMenuActioned extends Notification:
	
	var action: Enums.PauseMenuAction
	
	func _init(
		p_action: Enums.PauseMenuAction
	) -> void:
		action = p_action
