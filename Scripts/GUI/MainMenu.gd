extends Control

@onready var btn_start : Button = $Panel/VBoxContainer/BtnStart
@onready var btn_exit : Button = $Panel/VBoxContainer/BtnExit
@onready var btn_options = $Panel/VBoxContainer/BtnOptions

@onready var popup_menu = $Panel/VBoxContainer/BtnOptions/PopupMenu


func _ready():
	popup_menu.hide()

func _on_btn_start_button_down() -> void:
	GameManager._on_show_chapter_menu()
	
	pass

func _on_btn_exit_button_down() -> void:
	GameManager._exit_game()
	
	pass

func _on_btn_options_button_down() -> void:
	popup_menu.popup()
	
	pass 

func _on_popup_menu_index_pressed(index) -> void:
	match index:
		1: TranslationServer.set_locale("en")
		2: TranslationServer.set_locale("es") 
	pass 
