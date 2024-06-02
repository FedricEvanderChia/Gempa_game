extends CharacterBody2D
class_name Player

const SPEED = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")


var invent = preload("res://Inventory/Inventorysave.tres")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * SPEED
		anim.play("Walk")
		#print("Walk")
		#if velocity.y == 0:
			#anim.play("Run")
			#print("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.x == 0:
			anim.play("Idle")
			#print("Idle")
	#if velocity.y > 0:
		#anim.play("Fall")
		#print("Fall")
	move_and_slide()
	

func collectitem(item):
	invent.insertitem(item)
