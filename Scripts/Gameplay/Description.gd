extends Node3D

@export var description : String = ""
@onready var timer : Timer = $Timer

func _on_area_3d_body_entered(body : RigidBody3D) -> void:
	if body.is_in_group("Player"):
		Gui._on_show_description(description, true)
		
	pass
	
func _on_area_3d_body_exited(body : RigidBody3D) -> void:
	if body.is_in_group("Player"):
		timer.start()
		
	pass
	
func _on_timer_timeout() -> void:
	Gui._on_show_description("", false) 
	timer.stop()
	
	pass
