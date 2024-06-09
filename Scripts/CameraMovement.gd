extends Camera3D

@export var rotation_speed: float = 1.5
@export var return_speed: float = 0.025
@export var distance: float = 6.5
@export var y_offset: float = 2.5
@export var y_clamp_angle_factor : int = 12

var theta: float = 0.0
var phi: float = 0.0
var original_phi: float

@onready var rigid_body_3d = $"../RigidBody3D"

func _ready():
	original_phi = phi

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	
	# Get the input from the player
	var h_input: float = (Input.get_action_strength("right") - Input.get_action_strength("left")) * -1
	var v_input: float = Input.get_action_strength("backward") - Input.get_action_strength("forward")

	
	if (h_input != 0.0) or (v_input != 0.0):
		# Update the angles of the camera
		theta += h_input * rotation_speed * delta
		phi += v_input * rotation_speed * delta
		# Clamp the phi angle to avoid flipping the camera
		phi = clamp(phi, -PI/y_clamp_angle_factor, PI/y_clamp_angle_factor)
	else:
		# Return the camera to its original position
		phi = lerp(phi, original_phi, return_speed)

	# Calculate the new position of the camera
	var x: float = distance * sin(theta) * cos(phi)
	var y: float = distance * sin(phi) + y_offset
	var z: float = distance * cos(theta) * cos(phi)
	var new_position: Vector3 = Vector3(x, y, z)

	# Set the new position of the camera
	global_transform.origin = rigid_body_3d.global_transform.origin + new_position

	# Look at the player
	look_at(rigid_body_3d.global_transform.origin, Vector3.UP)
