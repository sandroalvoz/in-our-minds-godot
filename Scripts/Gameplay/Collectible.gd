# note: This script is very similar to Description.gd, but I need to figure out if I can check specific Node3D 
# by name or tag when Player entered Area3D to check if it is actually a collectable or not. For the moment
# I split in two differents scripts. Learn about this topics it this is a good practise or not in Godot.

extends Node3D

@export var description : String = ""
@onready var timer : Timer = $Timer

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
