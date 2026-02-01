extends CharacterBody2D

#player data
@export var speed := 75
@export var gravity := 500
@export var jumpvel := -175
@export var mask := 0
@export var respawnpos:=Vector2(0,0)
@onready var deathcounter: Label = $"../Label"
var counter = 0

#player progress
var jump = true
var hasleftmask = true
var leftMask = false
var rightMask = true
var shiftpressed = false

#animation data
var bases = ["idle","run","jump"]
var active = ["idle","run","jump"]

#plauer looking (needs fixed)
var faceway := 1

#leftmask nodes
@onready var on: Control = $"../Physical/Appear"
@onready var off: Control = $"../Physical/Dissapear"

#counters
@onready var deaths = $"Death Counter"

func respawn():
	deaths.died()
	self.global_position = respawnpos
	counter += 1
	deathcounter.text = "Deaths: "+str(counter)

func _ready():
	set_process_input(true) 
	on.hideBlocks()
	deathcounter.text = "Deaths: 0"

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump = true
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jumpvel
		elif (rightMask and jump):
			velocity.y = jumpvel
			jump = false
	if Input.is_key_pressed(KEY_SHIFT):
		if not shiftpressed and hasleftmask:
			shiftpressed = true
			switchLeftMask()
	else:
		shiftpressed = false
		

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()

	if not is_on_floor():
		$AnimatedSprite2D.play(active[2])
	elif direction != 0:
		velocity.x = direction * speed
		$AnimatedSprite2D.play(active[1])
	else:
		velocity.x = 0
		$AnimatedSprite2D.play(active[0])
	faceway = sign(direction)

	if faceway == -1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		
	
func switchLeftMask():
	leftMask = not leftMask
	if leftMask:
		active = ["left"+bases[0],"left"+bases[1],"left"+bases[2]]
		on.showBlocks()
		off.hideBlocks()
	else:
		active = bases
		off.showBlocks()
		on.hideBlocks()

func getRightMask():
	pass
	rightMask = true
<<<<<<< HEAD
=======
	leftMask = false
>>>>>>> liam
	bases = ["right"+bases[0],"right"+bases[1],"right"+bases[2]]
	active = ["left"+bases[0],"left"+bases[1],"left"+bases[2]]
	call_deferred("switchLeftMask")
	

func getLeftMask():
	hasleftmask = true
<<<<<<< HEAD
<<<<<<< HEAD
	leftMask = true
	active = ["left"+bases[0],"left"+bases[1],"left"+bases[2]]
	on.call_deferred("showBlocks")
	off.call_deferred("hideBlocks")

func setRespawn(pos):
	self.respawnpos = pos
=======
	switchLeftMask()
=======
	call_deferred("switchLeftMask")
>>>>>>> liam

func setRespawn(pos):
	self.respawnpos = pos
	print("set")
>>>>>>> liam
