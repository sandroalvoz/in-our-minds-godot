extends Control

@onready var btn_start = $Panel/VBoxContainer/BtnStart
@onready var btn_exit = $Panel/VBoxContainer/BtnExit

func _on_btn_start_button_down():
	GameManager._start_game()

func _on_btn_exit_button_down():
	GameManager._exit_game()
