extends Control

func _ready():
	visible = false
	
func _reset() -> void:
	visible = false
	
	GameManager._freeze_game(false)
	
	pass

func _on_btn_continue_button_down() -> void:
	_reset()

	pass

func _on_btn_main_menu_button_down() -> void:
	_reset()
	
	GameManager._reset_game()
	
	pass
