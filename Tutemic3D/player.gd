extends KinematicBody

export var _mouse_sensitivity := 0.08
export var _move_speed: float = 3
export var _acceleration: int = 100

var motion: Vector3

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event) -> void:
	aim(event)


func _physics_process(delta) -> void:
	movement(delta)


func aim(event: InputEvent) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity
		
		var current_tilt: float = $Camera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivity
		
		$Camera.rotation_degrees.x = clamp(current_tilt, -90, 90)


func movement(delta) -> void:
	var movement_vector: Vector3
	var forward_movement: Vector3
	var sideways_movement: Vector3
	
	if Input.is_action_pressed("move_forward"):
		forward_movement = -transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		forward_movement = transform.basis.z

	if Input.is_action_pressed("move_left"):
		sideways_movement = -transform.basis.x
	elif Input.is_action_pressed("move_right"):
		sideways_movement = transform.basis.x
	
	movement_vector = forward_movement + sideways_movement
	movement_vector = movement_vector.normalized()
	
#	movement_vector = movement_vector.linear_interpolate(Vector3.ZERO, _acceleration * delta)
#	motion += movement_vector * delta * _acceleration
	
	move_and_slide(movement_vector * _move_speed)
