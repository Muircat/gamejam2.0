extends Control

func showBlocks():
	visible = true
	set_physics_process(true)
	set_process(true)
	set_process_input(true)
	
func hideBlocks():
	visible = false
	set_physics_process(false)
	set_process(false)
	set_process_input(false)
