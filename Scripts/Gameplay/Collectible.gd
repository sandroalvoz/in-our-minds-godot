extends Node3D

@export var description : String = ""
@onready var timer = $Timer


func _on_area_3d_body_entered(body : RigidBody3D) -> void:
	if body.is_in_group("Player"):
		Gui._on_show_collectible(description, true)
		
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	pass
	
func _on_area_3d_body_exited(body : RigidBody3D) -> void:
	if body.is_in_group("Player"):
		timer.start()
		
	pass
	
func _on_timer_timeout() -> void:
	Gui._on_show_collectible("", false) 
	timer.stop()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	pass
