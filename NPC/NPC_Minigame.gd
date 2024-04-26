extends Resource


class_name NPC_Minigame

signal updateNPC

@export var needs: Array[NPC_Minigame]
var needs = []
func insertitem(item: SembakoNPC):
	var itemslots = slots.filter(func(slots):return slots.item == item)
	if !itemslots.is_empty():
		itemslots[0].amount +=1
	else:
			var emptyslots = slots.filter(func(slots): return slots.item == null)
			if !emptyslots.is_empty():
				emptyslots[0].item = item
				emptyslots[0].amount = 1
	updateNPC.emit()

