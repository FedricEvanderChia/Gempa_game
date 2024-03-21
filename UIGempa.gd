extends CanvasLayer

var inv = false
# Called when the node enters the scene tree for the first time.
func _ready():
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
		
