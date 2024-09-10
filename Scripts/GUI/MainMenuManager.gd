extends Control

@onready var btn_start = $"../BtnStart"
@onready var btn_exit = $"../BtnExit"

func _on_btn_start_button_down():
	SceneManager._change_scene("Level01", true)


func _on_btn_exit_button_down():
	SceneManager._change_scene("exit", true)
