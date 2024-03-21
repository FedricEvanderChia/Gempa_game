extends Control
@onready var inv: inventory_game = preload("res://Inventory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var buka_inventory = false


func _ready():
	update_slots()
	close()
	
func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])
		
		
func _process(delta):
	if Input.is_action_just_pressed("buka_inventorykey"):
		print("i")
		if buka_inventory:
			close()
		else:
			open()
		

func open():
	visible= true
	buka_inventory= true

func close():
	visible= false
	buka_inventory= false
