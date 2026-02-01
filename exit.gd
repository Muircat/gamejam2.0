extends Control

@onready var color_rect = $ColorRect
@onready var anim = $AnimationPlayer

func _ready():
	color_rect.visible = false

func fade():
	color_rect.visible = true
	anim.play("fade_in")
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://credits.tscn")
	
	
