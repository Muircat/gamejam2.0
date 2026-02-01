extends Area2D

@onready var control: Control = $".."

func _on_body_entered(body):
	print("fade")
	if body.name == "Knight":
		control.fade()
