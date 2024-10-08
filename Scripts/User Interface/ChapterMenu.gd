extends Control

@export var scene: String
@export var first_scene: bool = false
@export var timer_time: float = 2.5

@onready var btn_start : Button = $Panel/VBoxContainer/BtnStart
@onready var timer : Timer = $Timer

@onready var lbl_title : Label = $Panel/VBoxContainer/LblTitle

func _ready():
	timer.start(timer_time)
	btn_start.visible = false
	
	#_setup_labels()
	
	pass
	
#func _setup_labels() -> void:
	#lbl_title.text = GameManager._update_chapter_name()
	
	#pass	

func _on_btn_start_button_down() -> void:
	GameManager._start_game(scene)
	
	#if(first_scene): 
	#	GameManager._start_game()
	#else:
	#	SceneManager._change_scene(scene, true)
	
	pass

func _on_timer_timeout() -> void:
	timer.stop()
	btn_start.visible = true
	
	pass
