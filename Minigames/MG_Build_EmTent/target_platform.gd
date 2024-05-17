extends Area2D

class_name target_plat
var is_collided = false
@onready var button = $"../../"
# Called when the node enters the scene tree for the first time.
func _ready():
	button.is_pressed.connect(removePlat)
	

func removePlat():
	create_tween().tween_callback(queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


