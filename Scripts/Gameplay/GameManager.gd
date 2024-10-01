extends Node

@onready var current_level_name: String = ""

enum GUI_STATE {ENABLE, DISABLE}
enum GUI_MODE  {CONTINUE, RESET, STOP}

func _ready():
	_update_gui(GUI_STATE.DISABLE, GUI_MODE.STOP)
	TranslationServer.set_locale("en") # by default the game is 'en'
	
	pass

func _process(delta):
	
	if Input.is_action_just_pressed("exit"):
		#_reset_game()
		_freeze_game(true)
		PauseMenu.visible = true
			
	if Input.is_action_just_pressed("reload"):
		_reload_scene()
		
	pass
	
func _on_show_chapter_menu() -> void:
	SceneManager._change_scene("ChapterMenu", true)
		
func _start_game() -> void:
	SceneManager._current_scene_number = 0
	SceneManager._change_scene("Level01", true)
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	_update_gui(GUI_STATE.ENABLE, GUI_MODE.RESET) 
	
	pass
	
func _on_scene_changed() -> void:
	SceneManager._current_scene_number += 1	
	_update_gui(GUI_STATE.ENABLE, GUI_MODE.RESET) 
	
	pass
	
func _reload_scene() -> void:
	SceneManager._change_scene("reload", true)
	_update_gui(GUI_STATE.ENABLE, GUI_MODE.RESET) 
	
	pass
	
func _reset_game() -> void:
	SceneManager._current_scene_number = 0
	SceneManager._change_scene("MainMenu", true)
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	_update_gui(GUI_STATE.DISABLE, GUI_MODE.STOP) 
	
	pass
	
func  _exit_game() -> void:
	SceneManager._change_scene("exit", true)
	
	pass
	
func _update_gui(state : int, mode : int) -> void:
	#current_level_name = str(SceneManager._scene_names[SceneManager._current_scene_number]) 
	current_level_name = _update_scene_name(SceneManager._current_scene_number)
	
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
			
	pass
	
func _update_scene_name(current_index : int) -> String:
	match current_index:
		0: return tr("LEVEL_1_NAME")
		1: return tr("LEVEL_2_NAME")
		2: return tr("LEVEL_3_NAME")
		3: return tr("LEVEL_4_NAME")
		4: return tr("LEVEL_5_NAME")
	return "null"
	
func _freeze_game(state : bool) -> void:
	get_tree().paused = state
	
	if(state):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	pass
