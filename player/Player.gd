extends CharacterBody2D
class_name Player

@export var SPEED = 500.0
var stop = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
@onready var footstep = $footstep
var target = 1450
signal Obtain(item)
var invent = util.inventory
var once = true


func _ready():
	global.Receive.connect(reward)
	global.Give.connect(give)


func _physics_process(delta):
	global.Lastpos = self.global_position
	if global.cinema and !global.go_right:
		anim.play("Idle")
		return
	if not is_on_floor():
		velocity.y += gravity * delta

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if global.go_right:
		if global_position.x <= target:
			direction = 1
		else:
			direction = -1
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * SPEED
		anim.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.x == 0:
			anim.play("Idle")
			footstep.stop()

	move_and_slide()
	

func collectitem(item):
	Obtain.emit(item)
	invent.insertitem(item)


	if item.name == "Foto":
		global.go_right = false
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "FoundPhoto2")	
		

func reward(gift: String):
	var item : inventory_item = load(gift)
	Obtain.emit(item)
	invent.insertitem(item)

func give(thing: String):
	return invent.takeout(load(thing))
		
	
