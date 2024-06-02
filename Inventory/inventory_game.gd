extends Resource


class_name inventory_game

signal updateinv

@export var slots: Array[inventory_slot]

func insertitem(item: inventory_item):
	var itemslots = slots.filter(func(slots):return slots.item == item)
	if !itemslots.is_empty():
		itemslots[0].item = item
		itemslots[0].amount +=1
		
	else:
		var emptyslots = slots.filter(func(slots): return slots.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
	updateinv.emit()


func takeout(item: inventory_item):
	var itemslots = slots.filter(func(slots):return slots.item == item)
	if !itemslots.is_empty() and itemslots[0].amount >= global.quest_count:
		itemslots[0].item = item
		itemslots[0].amount -= global.quest_count
		if itemslots[0].amount == 0:
			itemslots[0].item = null
		global.quest_count = 0
		return true
	else:
		return false
