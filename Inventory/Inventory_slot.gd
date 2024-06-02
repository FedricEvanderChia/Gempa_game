extends Resource

class_name inventory_slot

@export var item: inventory_item
@export var amount: int

func _init(item = "undefined",amount = 0):
	item = item
	amount = amount
