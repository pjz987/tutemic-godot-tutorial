extends RayCast

var _is_mousing_over := false

func _input(event):
	var collided_area: Area = get_collider()
	
	if collided_area is Food:
		if !_is_mousing_over:
			_is_mousing_over = true
			GameEvents.emit_signal("food_moused_over", collided_area)
		
		if event is InputEventMouseButton and event.pressed:
			GameEvents.emit_signal("food_clicked", collided_area)
	elif _is_mousing_over:
		_is_mousing_over = false
		GameEvents.emit_signal("food_moused_out")
