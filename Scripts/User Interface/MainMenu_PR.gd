extends Control

@onready var btn_start : Button = $Panel/VBoxContainer/BtnStart
@onready var btn_exit : Button = $Panel/VBoxContainer/BtnExit
@onready var btn_options : Button = $Panel/VBoxContainer/BtnOptions

@onready var debug_next_level : TextEdit = $Panel/DebugTextEdit
@onready var on_debug_mode : bool = false

@onready var optionsMenu: Control = $Panel/OptionsMenu


const FULL_SCREEN_INDEX : int = 4

func _process(delta):
	#debug mode
	if Input.is_action_just_pressed("DEBUG_MODE"):
		debug_next_level.visible = true
		on_debug_mode = true

func _on_btn_start_button_down() -> void:
	if(on_debug_mode): # debug mode
		GameManager._start_game(debug_next_level.text)
	else:
		GameManager._on_show_chapter_menu()
	
	pass

func _on_btn_exit_button_down() -> void:
	GameManager._exit_game()
	
	pass

func _on_btn_options_button_down() -> void:
	optionsMenu.visible = true
	pass 
		
func _on_fullscreen() -> void:
	if(GameManager.full_screen_mode):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		#popup_menu.set_item_checked(FULL_SCREEN_INDEX, false)
		GameManager.full_screen_mode = false
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		#popup_menu.set_item_checked(FULL_SCREEN_INDEX, true)
		GameManager.full_screen_mode = true
	
	pass


