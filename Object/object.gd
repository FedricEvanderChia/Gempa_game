extends Node2D
class_name object 
var selected = false
var initialPos: Vector2 
var in_drop_box = false
var customer
@onready var sembako = $"../"
signal clearOrder(name)
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
	if global.needs.has(name) :
		print("Benar")
		global.needs.remove_at(global.needs.find(name))
		clearOrder.emit()
	else:
		global.minigame_score -= 50 
		global.life -= 1
		$"../Camera2D".shake()
	if global.needs.is_empty():
		global.goal = true
		sembako.goal -= 1
		add_score(100)
		if global.quest_status == "Sembako" and global.quest_count != 0:
			global.quest_count -=1
			print(global.quest_count)
		add_time(2)
		
func add_time(val):
	$"../AddTime".text = "+%d" % val
	$"../CanvasLayer/Control".sec +=val
	$"../AddTime".show()
	$"../AddTime".position = Vector2(575,20)
	$"../AddTime".modulate = Color(1, 1, 1, 1)
	create_tween().tween_property($"../AddTime","position",Vector2(575,0),0.5)
	create_tween().tween_property($"../AddTime","modulate", Color(1, 1, 1, 0), 0.5)

func add_score(val):
	$"../AddScore".text = "+%d" % val
	global.minigame_score += val
	$"../AddScore".show()
	$"../AddScore".position = Vector2(330,20)
	$"../AddScore".modulate = Color(1, 1, 1, 1)
	create_tween().tween_property($"../AddScore","position",Vector2(330,0),1)
	create_tween().tween_property($"../AddScore","modulate", Color(1, 1, 1, 0),1)
