extends Control

@onready var level_label = $LevelPanel/LevelLabel
@onready var description_label = $DescriptionPanel/DescriptionLabel
@onready var description_panel = $DescriptionPanel


func _ready():
	var scene_number = str(SceneManager._current_scene)
	level_label.text = scene_number + "\n" + "scene_name"

func on_show_description(messg : String) -> void :
	description_panel.visible = true
	description_label.text = messg 
