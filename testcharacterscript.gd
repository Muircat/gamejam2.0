extends CharacterBody2D

@export var speed := 200
@export var gravity := 200
@export var jumpvel := -300
@export var mask := 0
var jump = true

var faceway := 1

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
		faceway = sign(direction)
		velocity.x = direction * speed
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("idle")

	if faceway == -1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
