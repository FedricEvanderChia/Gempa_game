extends Panel

@onready var item_visual: Sprite2D =$CenterContainer/Panel/item_display
@onready var amount_text: Label =$CenterContainer/Panel/Label
var itemscale 
var item: inventory_item
func update(slots: inventory_slot):
	if !slots.item:
			item_visual.visible = false
			amount_text.visible = false
			
	else:
			if slots.item.resource_path == 	"res://Inventory/items/Dokumen.tres":
				itemscale = $CenterContainer/Panel/item_display.scale 
				$CenterContainer/Panel/item_display.scale = Vector2(0.1,0.1)
		
			
			item_visual.visible = true
			item_visual.texture = slots.item.texture
			if slots.amount > 0 :
				amount_text.visible = true
				amount_text.text = str(slots.amount)
		
