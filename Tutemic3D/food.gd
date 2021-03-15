extends Area

class_name Food

export (String) var food_name

var _spin_speed: float = 180
var _is_mouse_over := false
var _mesh: Spatial

func _ready():
	GameEvents.connect("food_moused_over", self, "_on_mouse_entered")
	GameEvents.connect("food_moused_out", self, "_on_mouse_out")
	
	set_up_reference_to_mesh()



func set_up_reference_to_mesh() -> void:
	var mesh_child_index = self.get_child_count() - 1
	_mesh = get_child(mesh_child_index)


func _process(delta):
	if _is_mouse_over:
		_mesh.rotation_degrees.y += _spin_speed * delta


func _on_mouse_entered(food: Food):
	if food == self:
		_is_mouse_over = true
		$SpotLight.visible = true

func _on_mouse_out():
	_is_mouse_over = false
	$SpotLight.visible = false
