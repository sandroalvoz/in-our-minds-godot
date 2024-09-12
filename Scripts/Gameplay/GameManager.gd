extends Node

@export var current_level_name: String = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("exit"):
		_reset_game()
			
	if Input.is_action_just_pressed("reload"):
		_reload_scene()
		
func _on_scene_changed():
	SceneManager._current_scene_number += 1
	current_level_name = str(SceneManager._scene_names[SceneManager._current_scene_number])
	Gui.level_label.text = current_level_name
	
func _start_game():
	SceneManager._current_scene_number = 0
	current_level_name = str(SceneManager._scene_names[0])
	Gui.level_label.text = current_level_name
	
	SceneManager._change_scene("Level01", true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Gui._on_set_chrono(true)
	Gui._on_set_visibility(true)
	
func _reset_game():
	SceneManager._change_scene("MainMenu", true)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Gui._on_set_chrono(false)
	Gui._on_set_visibility(false)
	
func  _exit_game():
	SceneManager._change_scene("exit", true)
	
func _reload_scene():
	SceneManager._change_scene("reload", true)
	
