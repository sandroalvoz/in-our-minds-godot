extends Control

@onready var btn_start : Button = $Panel/VBoxContainer/BtnStart
@onready var btn_exit : Button = $Panel/VBoxContainer/BtnExit
@onready var btn_options = $Panel/VBoxContainer/BtnOptions

@onready var popup_menu = $Panel/VBoxContainer/BtnOptions/PopupMenu
@onready var debug_text_edit = $Panel/DebugTextEdit

const FULL_SCREEN_INDEX : int = 4

func _ready():
	popup_menu.hide()	
	_on_fullscreen()
	
func _process(delta):
	#DEBUG MODE
	if Input.is_action_just_pressed("DEBUG_MODE"):
		debug_text_edit.visible = true
		
	pass

func _on_btn_start_button_down() -> void:
	GameManager._on_show_chapter_menu()
	
	pass

func _on_btn_exit_button_down() -> void:
	GameManager._exit_game()
	
	pass

func _on_btn_options_button_down() -> void:
	popup_menu.popup()
	
	pass 

#bug: this is colled 2 times. idk why
func _on_popup_menu_id_pressed(id) -> void:
		match id:
			1: TranslationServer.set_locale("en")
			2: TranslationServer.set_locale("es") 
			3: _on_fullscreen()
		pass
		
func _on_fullscreen() -> void:
	if(!GameManager.full_screen_mode):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		popup_menu.set_item_checked(FULL_SCREEN_INDEX, true)		
		
		GameManager.full_screen_mode = true
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		popup_menu.set_item_checked(FULL_SCREEN_INDEX, false)
		
		GameManager.full_screen_mode = false

	!GameManager.full_screen_mode

func _on_text_edit_text_changed():
	GameManager.start_level = debug_text_edit.text
	pass 
