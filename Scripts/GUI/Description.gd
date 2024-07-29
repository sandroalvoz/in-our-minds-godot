extends Node3D

@export var description : String

func _on_area_3d_body_entered(body):
	Gui.on_show_description(description)

func _on_area_3d_body_exited(body):
	Gui.on_show_description("") # todo change
