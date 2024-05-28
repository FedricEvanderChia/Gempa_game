extends Panel

@onready var item_visual: Sprite2D =$CenterContainer/Panel/item_display
@onready var amount_text: Label =$CenterContainer/Panel/Label

func update(slots: inventory_slot):
	if !slots.item:
			item_visual.visible = false
			amount_text.visible = false
			
	else:
			item_visual.visible = true
			item_visual.texture = slots.item.texture
			if slots.amount > 0 :
				amount_text.visible = true
				amount_text.text = str(slots.amount)
		
