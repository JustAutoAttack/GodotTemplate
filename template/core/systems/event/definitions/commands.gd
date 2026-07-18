class_name Commands
extends RefCounted

# ===
# Misc
# ===

# --- Save/Load ---
class StartLoading extends Command: pass
class StopLoading extends Command: pass
class StartSaving extends Command: pass
class StopSaving extends Command: pass
class SaveGame extends Command: pass
class SaveSettings extends Command: pass

# ===
# Scene
# ===

# --- Main ---
class LoadBootsplash extends Command: pass
class LoadGame extends Command: pass

# --- Game ---
class LoadTitle extends Command: pass
class LoadWorld extends Command: pass

# ===
# Audio
# ===

# --- Music ---
class StartTitleMusic extends Command: pass
class StartWorldMusic extends Command: pass
class PlayGameOverMusic extends Command: pass
class ReplayLastMusic extends Command: pass
class ReplayCurrentMusic extends Command: pass
class SkipCurrentMusic extends Command: pass
class ToggleMusicPaused extends Command: 
	
	var is_paused: bool
	
	func _init(
		p_is_paused: bool
	) -> void:
		is_paused = p_is_paused
class ToggleMusicLoop extends Command:
	
	var enabled: bool
	
	func _init(
		p_enabled: bool
	) -> void:
		enabled = p_enabled
class ToggleMusicShuffle extends Command:
	
	var enabled: bool
	
	func _init(
		p_enabled: bool
	) -> void:
		enabled = p_enabled

# --- SFX ---
class PlaySFX extends Command:
	
	var sfx_type: Enums.SFXType
	
	func _init(
		p_sfx_type: Enums.SFXType
	) -> void:
		sfx_type = p_sfx_type
class KillAllSFX extends Command: pass

# ===
# UI
# ===
class HideAllUI extends Command: pass
class HideAllMenus extends Command: pass
class ToggleMenu extends Command:
	
	var type: Enums.MenuType
	var is_visible: bool
	
	func _init(
		p_type: Enums.MenuType, 
		p_is_visible: bool
	):
		type = p_type
		is_visible = p_is_visible

class ToggleHUD extends Command:
	
	var is_visible: bool
	
	func _init(
		p_is_visible: bool
	):
		is_visible = p_is_visible
