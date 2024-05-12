extends CanvasLayer

var inv = false
var paused = false
@onready var pausemenu = $pause_ui
# Called when the node enters the scene tree for the first time.
func _ready():
	global.Sdialogue.connect(cinema)
	global.Edialogue.connect(Uncinema)
	pass # Replace with function body.
# untuk pergerakan player, hanya tinggal memanggil action ui_left

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bag_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if inv:
			get_node("Bag/AnimatedSprite2D").play("Close")
			await get_node("Bag/AnimatedSprite2D").animation_finished
			get_node("inventory_ui").hide()
			inv = false
		elif inv == false:	
			get_node("Bag/AnimatedSprite2D").play("Open")
			await get_node("Bag/AnimatedSprite2D").animation_finished
			get_node("inventory_ui").show()
			inv = true

func _on_pause_pressed():
	pause()
	
func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	pausemenu.visible = new_pause_state


func _on_tc_button_right_pressed():
	$Control2/tc_button_right.scale = Vector2 (0.9,0.9)
func _on_tc_button_left_pressed():
	$Control2/tc_button_left.scale = Vector2 (0.9,0.9)
func _on_tc_button_right_released():
	$Control2/tc_button_right.scale = Vector2 (1,1)
func _on_tc_button_left_released():
	$Control2/tc_button_left.scale = Vector2 (1,1)

func cinema():
	print("cinema")
	hideAll()
	create_tween().tween_property($Cinematic,"position", Vector2(0,-80),1)
	create_tween().tween_property($Cinematic2,"position", Vector2(0,547),1)
func Uncinema():
	print("Uncinema")
	create_tween().tween_property($Cinematic2,"position", Vector2(0,647),1)
	await create_tween().tween_property($Cinematic,"position", Vector2(0,-180),1)
	showAll()

func hideAll():
	create_tween().tween_property($Control2,"visible",false,0)
	create_tween().tween_property($PauseBtn,"visible",false,0)
	create_tween().tween_property($Bag,"visible",false,0)
func showAll():
	create_tween().tween_property($Control2,"visible",true,0)
	create_tween().tween_property($PauseBtn,"visible",true,0)
	create_tween().tween_property($Bag,"visible",true,0)
