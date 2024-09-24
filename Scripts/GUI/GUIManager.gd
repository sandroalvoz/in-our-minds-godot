extends Control

@export var chrono: Node

@onready var panel_container : PanelContainer = $PanelContainer
@onready var level_label: Label = $PanelContainer/VBoxContainer/LevelLabel
@onready var description_label : Label = $PanelContainer/DescriptionLabel
@onready var stamina_progress_bar : TextureProgressBar = $PanelContainer/StaminaProgressBar

func _ready():
	description_label.visible = false
	SceneManager.scene_changed.connect(GameManager._on_scene_changed)
	
func _reset_gui() -> void:
	_show_gui(true)
	_on_set_chrono(true)
	_reset_stamina_progress_bar()
	
func _stop_gui() -> void:
	_show_gui(false)
	_on_set_chrono(false)
	_reset_stamina_progress_bar()
	level_label.text = ""
	
func _show_gui(state : bool) -> void:
	panel_container.visible = state

func _on_show_description(messg : String, state: bool) -> void:
	description_label.visible = state
	description_label.text = messg 
	
func _on_set_chrono(state : bool) -> void:
	chrono.on_chrono = state
	chrono.reset_chrono()
	
func _consume_stamina_progress_bar() -> bool:
	if(stamina_progress_bar.value > stamina_progress_bar.min_value):
		stamina_progress_bar.value -= 1
	else:
		return false
	
	return true
	
func _reset_stamina_progress_bar() -> void:
	stamina_progress_bar.value = stamina_progress_bar.max_value
