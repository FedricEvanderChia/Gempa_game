extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.check_grass == true:
		$".".queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("Click"):
		#var dokumen = item_collectible_dokumen.
		$"../..".dropItem("res://Inventory/items/Dokumen.tres",$".".global_position )
		$".".queue_free()
		global.check_grass = true
		
