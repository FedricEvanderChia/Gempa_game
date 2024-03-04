extends Node2D
class_name object 

var selected = false
var initialPos: Vector2 
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
			
func _on_area_2d_mouse_entered():
	scale = Vector2 (1.05,1.05)

func _on_area_2d_mouse_exited():
	scale = Vector2 (1,1)

func _on_area_2d_body_entered(body): 
	body.modulate = Color(Color.REBECCA_PURPLE,1)
	prints("tambah 1",name,position)
	
func _on_area_2d_body_exited(body):
	body.modulate = Color(Color.MEDIUM_PURPLE,0.7)
	prints("gajadi,",name,"ga masuk",position)
