extends CharacterBody2D

@export var speed := 275
@export var gravity := 500
@export var jumpvel := -175
@export var mask := 0
var jump = true

@export var respawnpos := Vector2(0,0)

var faceway := 1

func respawn():
	self.global_position = respawnpos


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump = true
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jumpvel
		elif (mask >= 2 and jump):
			velocity.y = jumpvel
			jump = false

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()

	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	elif direction != 0:
		velocity.x = direction * speed
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("idle")
	faceway = sign(direction)

	if faceway == -1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
