extends RigidBody3D

@export var movement_speed : float = 385.0
@export var max_speed : float = 7.5

@onready var camera_3d = $"../Camera3D"

func _physics_process(delta: float) -> void:
	movement(delta)
	
# Player physical movement
# params: delta: float - time between frames
func movement(delta) -> void:
	
	# Get the input from the player
	var f_input: float = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	var h_input: float = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	# Get the camera transform
	var camera_transform = camera_3d.get_camera_transform()
	
	# Get the camera direction
	var relative_camera_direction_x = camera_transform.basis.x.normalized()
	var relative_camera_direction_z = camera_transform.basis.z.normalized()
	
	# Calculate the direction of the movement
	var direction_f = f_input * relative_camera_direction_z
	var direction_h = h_input * relative_camera_direction_x
	
	# Apply the force to the player
	apply_central_force(direction_f * movement_speed * delta)
	apply_central_force(direction_h * movement_speed * delta)



