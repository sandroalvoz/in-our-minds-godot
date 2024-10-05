extends RigidBody3D

@export var movement_speed : float = 385.0
@export var max_velocity : float = 7.5
@export var impulse_force : float = 5.0
@export var slowdown_factor: float = 0.2
@export var fov_change_amount : float = 15.0 

var original_fov : float
var impulse_fov : float

@onready var camera_3d = $"../CameraContainer/HRotation/VRotation/SpringArm3D/Camera3D"
@onready var original_time_scale : float = Engine.time_scale

# Called when the node enters the scene tree for the first time.
func _ready():
	original_fov = camera_3d.fov
	impulse_fov = original_fov - fov_change_amount

	pass 

func _physics_process(delta) -> void:
	if linear_velocity.x > max_velocity:
		linear_velocity.x = max_velocity
	if linear_velocity.x < -max_velocity:
		linear_velocity.x = -max_velocity
	if linear_velocity.z > max_velocity:
		linear_velocity.z = max_velocity
	if linear_velocity.z < -max_velocity:
		linear_velocity.z = -max_velocity
	
	movement(delta)
	handle_impulse()
	pass
	
func movement(delta) -> void:
	var f_input = Input.get_action_raw_strength("backward") - Input.get_action_raw_strength("forward")
	var h_input = Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left")
	
	var camera_tranform = camera_3d.get_camera_transform()
	
	var relative_camera_direction_z = camera_tranform.basis.z.normalized()
	var relative_camera_direction_x = camera_tranform.basis.x.normalized()
	
	var direction_f = f_input * relative_camera_direction_z
	var direction_h = h_input * relative_camera_direction_x
	
	apply_central_force(direction_f * movement_speed * delta)
	apply_central_force(direction_h * movement_speed * delta)
	pass
	
func handle_impulse() -> void:
	if Input.is_action_pressed("impulse"):
		Engine.time_scale = slowdown_factor
	
	if Input.is_action_just_released("impulse"):
		Engine.time_scale = original_time_scale
		if(Gui._consume_stamina_progress_bar()):
			var camera_transform = camera_3d.get_camera_transform()
			var forward_direction = -camera_transform.basis.z.normalized()  
		
			apply_impulse(forward_direction * impulse_force)
		else:
			#the user cannot impulse
			pass
		
	pass
