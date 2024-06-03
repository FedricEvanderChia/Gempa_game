extends CanvasLayer

var inv = false
var paused = false
@onready var pausemenu = $pause_ui
@onready var sounds_b = $button_sounds
@onready var sounds_backpack = $backpack_sounds
@onready var sounds_backpack_c = $backpack_sounds_close
@export var item_collect : items_collectibles
# Called when the node enters the scene tree for the first time.
func _ready():
	global.Sdialogue.connect(cinema)
	global.Edialogue.connect(Uncinema)
	
# untuk pergerakan player, hanya tinggal memanggil action ui_left

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_bag_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if inv:
			sounds_backpack_c.play()
			get_node("Bag/AnimatedSprite2D").play("Close")
			await get_node("Bag/AnimatedSprite2D").animation_finished
			get_node("inventory_ui").hide()
			inv = false
		elif inv == false:	
			sounds_backpack.play()
			get_node("Bag/AnimatedSprite2D").play("Open")
			await get_node("Bag/AnimatedSprite2D").animation_finished
			get_node("inventory_ui").show()
			inv = true

func _on_pause_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
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
	


func _on_items_collectibles_obtain(item : inventory_item):
	$obtain.text = "Kamu mendapatkan sebuah\n" + item.name 
	$item.texture = item.texture
	$obtain.show()
	$item.show()
	await get_tree().create_timer(2).timeout
	$obtain.hide()
	$item.hide()
