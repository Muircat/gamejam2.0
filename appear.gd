extends Control

func showBlocks():
	visible = true
	set_physics_process(true)
	set_process(true)
	set_process_input(true)
	for shape in self.get_children():
		if shape is StaticBody2D:
			for child in shape.get_children():
				if child is CollisionPolygon2D or child is CollisionShape2D:
					child.disabled = false
	
func hideBlocks():
	visible = false
	set_physics_process(false)
	set_process(false)
	set_process_input(false)
	for shape in self.get_children():
		if shape is StaticBody2D:
			for child in shape.get_children():
				if child is CollisionPolygon2D or child is CollisionShape2D:
					child.disabled = true
