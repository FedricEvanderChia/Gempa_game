extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("left")
	get_node("Button").hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func  _physics_process(delta):
	pass


func _on_body_entered(body):
	print("im in da hood of dis shop boiii")
	get_node("AnimatedSprite2D").play("right")
	get_node("Button").show()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Minigames/Sembako.tscn")
