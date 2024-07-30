extends Node3D

@export var description : String
@onready var timer = $Timer

func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		Gui.on_show_description(description)
	
func _on_area_3d_body_exited(body):
	if body.is_in_group("Player"):
		timer.start()
	
func _on_timer_timeout():
	Gui.on_not_show_description() 
	timer.stop()
