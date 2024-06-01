extends Control
@onready var inv: inventory_game = preload("res://Inventory/Inventorysave.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var buka_inventory = false
var loader
func _ready():
	inv.updateinv.connect(update_slots)
	#util.loadinv.connect(load_slots)
	update_slots()
	close()
	
func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
		
func load_slots():
	pass
	if FileAccess.file_exists("res://Inventory/Inventorysave.tres") == true:
		inv = ResourceLoader.load("res://Inventory/Inventorysave.tres").duplicate(true)


		
		
func _process(delta):
	update_slots()
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
