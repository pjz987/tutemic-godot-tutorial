extends Area

class_name Food

func _ready():
	GameEvents.connect("food_clicked", self, "_on_mouse_entered")


func _on_mouse_entered():
	print("mouse over food")
