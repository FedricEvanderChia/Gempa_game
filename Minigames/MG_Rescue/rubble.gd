extends Node2D
class_name Rubble
var selected = false
var initialPos: Vector2 
var in_drop_box = false
var customer

func _ready():
	initialPos = global_position
	
func _process(delta):
	if selected:
		followMouse()

func followMouse():
	position = get_global_mouse_position()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			selected = false
			if in_drop_box:
				print("yes")
			else:
				print("no")
				
func _on_area_2d_body_entered(body): 
	in_drop_box = true
	
func _on_area_2d_body_exited(body):
	in_drop_box = false
