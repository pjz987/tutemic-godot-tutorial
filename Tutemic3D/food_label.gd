extends Label

func _ready():
	GameEvents.connect("food_moused_over", self, "_on_food_hovered")
	GameEvents.connect("food_moused_out", self, "_on_food_unhovered")


func _on_food_hovered(food: Food) -> void:
	self.text = food.food_name
	visible = true


func _on_food_unhovered(food: Food) -> void:
	visible = false
