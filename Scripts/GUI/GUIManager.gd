extends Control

@export var chrono: Node

@onready var panel_container = $PanelContainer
@onready var level_label = $PanelContainer/VBoxContainer/LevelLabel
@onready var description_label = $PanelContainer/DescriptionLabel

func _ready():
	description_label.visible = false
	SceneManager.scene_changed.connect(GameManager._on_scene_changed)
	
	_on_set_visibility(false)

func _on_show_description(messg : String) -> void:
	description_label.visible = true
	description_label.text = messg 
	
func _on_not_show_description() -> void:
	description_label.visible = false
	description_label.text = ""
	
func _on_set_chrono(state : bool) -> void:
	chrono.on_chrono = state
	chrono.reset_chrono()
	
func _on_set_visibility(state : bool) -> void:
	panel_container.visible = state
