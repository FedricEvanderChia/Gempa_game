extends Node2D

var selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if selected:
		followMouse()

func followMouse():
	position = get_local_mouse_position()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

	
	
