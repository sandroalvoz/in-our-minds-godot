extends Node

@onready var current_level_name: String = ""

enum GUI_STATE {ENABLE, DISABLE}
enum GUI_MODE  {CONTINUE, RESET, STOP}

func _ready():
	_update_gui(GUI_STATE.DISABLE, GUI_MODE.STOP)

func _process(delta):
	
	if Input.is_action_just_pressed("exit"):
		_reset_game()
			
	if Input.is_action_just_pressed("reload"):
		_reload_scene()
			
func _start_game() -> void:
	SceneManager._current_scene_number = 0
	SceneManager._change_scene("Level01", true)
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	_update_gui(GUI_STATE.ENABLE, GUI_MODE.RESET) 
	
func _on_scene_changed() -> void:
	SceneManager._current_scene_number += 1	
	_update_gui(GUI_STATE.ENABLE, GUI_MODE.RESET) 
	
func _reload_scene() -> void:
	SceneManager._change_scene("reload", true)
	_update_gui(GUI_STATE.ENABLE, GUI_MODE.RESET) 
	
func _reset_game() -> void:
	SceneManager._current_scene_number = 0
	SceneManager._change_scene("MainMenu", true)
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	_update_gui(GUI_STATE.DISABLE, GUI_MODE.STOP) 
	
func  _exit_game() -> void:
	SceneManager._change_scene("exit", true)
	
func _update_gui(state : int, mode : int) -> void:
	current_level_name = str(SceneManager._scene_names[SceneManager._current_scene_number]) 
	
	Gui.level_label.text = current_level_name
	
	match state:
		GUI_STATE.ENABLE:
			Gui._show_gui(true)
		GUI_STATE.DISABLE:
			Gui._show_gui(false)
			
	match mode:
		GUI_MODE.CONTINUE:
			pass
		GUI_MODE.RESET:
			Gui._reset_gui()
		GUI_MODE.STOP:
			Gui._stop_gui()


	
