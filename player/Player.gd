extends CharacterBody2D
class_name Player

const SPEED = 500.0
var stop = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
var target = 1450

var invent = preload("res://Inventory/Inventorysave.tres")

func _ready():
	global.Receive.connect(reward)
	global.Give.connect(give)
func _physics_process(delta):
	# Add the gravity.
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

	move_and_slide()
	

func collectitem(item):
	invent.insertitem(item)
	if item.name == "Foto":
		global.go_right = false
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "FoundPhoto2")	
		

func reward(gift: String):
	invent.insertitem(load(gift))

func give(thing: String):
	return invent.takeout(load(thing))
		
	
