extends Control

@onready var btn_start = $Panel/VBoxContainer/BtnStart
@onready var timer = $Timer

func _ready():
	timer.start(5)
	btn_start.visible = false

func _on_btn_start_button_down():
	GameManager._start_game()
	
	pass

func _on_timer_timeout():
	timer.stop()
	btn_start.visible = true
	
	pass
