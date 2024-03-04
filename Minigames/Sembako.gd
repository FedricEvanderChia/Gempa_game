extends Node2D

var selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		followMouse()

func followMouse():
	position = get_local_mouse_position()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


#func _on_tenda_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
#		if event.pressed:
#			selected = true
#		else:
#			selected = false



