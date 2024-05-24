extends CharacterBody2D

@onready var patrol_path : Node2D = $patrol
@export var speed : int
func _physics_process(delta):
	velocity = patrol_path.direction * speed
	move_and_slide()

func put_out():
	$CollisionShape2D.queue_free()
	$Icon.play("put_out")
	await $Icon.animation_finished
