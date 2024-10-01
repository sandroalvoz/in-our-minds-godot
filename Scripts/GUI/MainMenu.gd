extends Control

@onready var btn_start : Button = $Panel/VBoxContainer/BtnStart
@onready var btn_exit : Button = $Panel/VBoxContainer/BtnExit

func _on_btn_start_button_down() -> void:
	GameManager._on_show_chapter_menu()
	
	pass

func _on_btn_exit_button_down() -> void:
	GameManager._exit_game()
	
	pass
