extends Control

@onready var btn_start = $Panel/VBoxContainer/BtnStart
@onready var timer = $Timer

@onready var lbl_title = $Panel/VBoxContainer/LblTitle
#@onready var lbl_description = $Panel/VBoxContainer/LblDescription


func _ready():
	timer.start(5)
	btn_start.visible = false
	_setup_labels()
	
	pass
	
func _setup_labels() -> void:
	lbl_title.text = GameManager._update_chapter_name()
	pass	

func _on_btn_start_button_down():
	GameManager._start_game()
	
	pass

func _on_timer_timeout():
	timer.stop()
	btn_start.visible = true
	
	pass
