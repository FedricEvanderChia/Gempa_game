extends Node2D
class_name object 

var selected = false
var initialPos: Vector2 
var in_drop_box = false
# Called when the node enters the scene tree for the first time.
func _ready():
	initialPos = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
			position = initialPos
			if in_drop_box:
				print("tambah 1 ",name, position)
			else:
				print(name,"-nya ga masuk bego")
func _on_area_2d_mouse_entered():
	scale = Vector2 (1.05,1.05)

func _on_area_2d_mouse_exited():
	scale = Vector2 (1,1)

func _on_area_2d_body_entered(body): 
	body.modulate = Color(Color.REBECCA_PURPLE,1)
	in_drop_box = true
	
	
func _on_area_2d_body_exited(body):
	body.modulate = Color(Color.MEDIUM_PURPLE,0.7)
	in_drop_box = false
