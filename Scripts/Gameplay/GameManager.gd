extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		SceneManager._change_scene("MainMenu", true)
			
	if Input.is_action_just_pressed("reload"):
		SceneManager._change_scene("reload", true)
		
