extends Area2D

func _on_body_entered(body):
	if body.name == "Knight":
		body.setRespawn(self.global_position)
