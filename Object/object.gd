extends Node2D
class_name object 
var selected = false
var initialPos: Vector2 
var in_drop_box = false
var customer

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
				customer = NPC.new()
				validate()
				var order = "Order"+name
				
				print(customer.needs.size())
			else:
				print(name,"-nya ga masuk bego")
func _on_area_2d_mouse_entered():
	scale = Vector2 (1.05,1.05)

func _on_area_2d_mouse_exited():
	scale = Vector2 (1,1)

func _on_area_2d_body_entered(body): 
	in_drop_box = true
	
func _on_area_2d_body_exited(body):
	in_drop_box = false

func validate():
	print("validate "+name)
	var valid = 0
	for number in range(global.needs.size()):
		if global.needs[number] == name:
			valid += 1
			print("Benar")
			global.minigame_score += 1
			global.needs.remove_at(number)
			break
		elif global.needs[number] != name:
			valid -= 1
			
	if valid == -3:
		global.minigame_score -= 1
		print("valid: ",valid)
	if global.needs.is_empty():
		global.goal = true
