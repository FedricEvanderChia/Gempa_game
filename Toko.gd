extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("left")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func  _physics_process(delta):
	pass


func _on_body_entered(body):
	print("im in da hood of dis shop boiii")
	get_node("AnimatedSprite2D").play("right")
