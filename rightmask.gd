extends Area2D

func _on_body_entered(body):
	if body.name == "Knight":
		body.getRightMask()
		queue_free()
