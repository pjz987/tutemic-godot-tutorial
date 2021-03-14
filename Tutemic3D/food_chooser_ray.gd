extends RayCast


func _input(event):
	var collided_area: Area = get_collider()
	if collided_area is Food:
		print(collided_area.name)
		GameEvents.emit_signal("food_moused_over", collided_area)
