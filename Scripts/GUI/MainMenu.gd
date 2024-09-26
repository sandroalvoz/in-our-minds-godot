extends Control

@onready var btn_start : Button = $Panel/VBoxContainer/BtnStart
@onready var btn_exit : Button = $Panel/VBoxContainer/BtnExit

func _on_btn_start_button_down() -> void:
	GameManager._start_game()
	
	pass

func _on_btn_exit_button_down() -> void:
	GameManager._exit_game()
	
	pass
