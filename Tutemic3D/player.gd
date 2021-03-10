extends KinematicBody

export var _mouse_sensitivity := 0.05


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity
		$Camera.rotation_degrees.x -= mouse_motion.relative.y * _mouse_sensitivity
