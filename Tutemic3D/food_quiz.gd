extends Spatial

export(Resource) var _dialogue = _dialogue as Dialogue

func _ready():
	pass


func _on_DialogTrigger_body_entered(body):
	GameEvents.emit_signal("dialog_initiated", _dialogue)