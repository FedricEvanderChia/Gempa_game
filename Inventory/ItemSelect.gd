extends TextureButton


func _on_toggled(toggled_on):
	var idx = int($"..".name.right(2))
	if $"../../../..".inv.slots[idx-1].item != null:
		var nama = $"../../../..".inv.slots[idx-1].item.name
		var gambar = $"../../../..".inv.slots[idx-1].item.texture
		$"../../../../ItemDescription/NinePatchRect/VBoxContainer/Name".text = nama
		$"../../../../ItemDescription/NinePatchRect/Panel/CenterContainer/Panel/item_display".texture = gambar
	else:
		button_pressed = false
