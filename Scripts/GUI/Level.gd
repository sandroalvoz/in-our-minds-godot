extends PanelContainer

@onready var gui_manager = $".." 
@onready var label = $Label 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var scene_number = str(SceneManager._current_scene)
	var scene_name = gui_manager.scene_name
	label.text = scene_number + "\n" + scene_name
	
