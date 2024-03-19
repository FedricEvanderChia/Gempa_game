extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("idle")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
