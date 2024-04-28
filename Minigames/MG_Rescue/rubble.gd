extends Node2D
class_name Rubble
var selected = false
var initialPos: Vector2 
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
			#mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			selected = false
				
func _on_area_2d_body_entered(body): 
	GlbRescue.rubble+=1
	print(name + "entered")
	
func _on_area_2d_body_exited(body):
	GlbRescue.rubble-=1
	print(name + "exited")
