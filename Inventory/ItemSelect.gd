extends TextureButton


func _on_toggled(toggled_on):
	for i in range(0,12):
		$"../../../..".slots[i].get_node("Selection").button_pressed = false
	var idx = int($"..".name.right(2))
	if $"../../../..".inv.slots[idx-1].item != null:
		var nama = $"../../../..".inv.slots[idx-1].item.name
		var gambar = $"../../../..".inv.slots[idx-1].item.texture
		var deskripsi = $"../../../..".inv.slots[idx-1].item.desc
		$"../../../../ItemDescription/NinePatchRect/VBoxContainer/Name".text = nama
		$"../../../../ItemDescription/NinePatchRect/Panel/CenterContainer/Panel/item_display".texture = gambar
		$"../../../../ItemDescription/NinePatchRect/VBoxContainer/Desc".text = deskripsi
		if nama == 	"Dokumen":
			$"../../../../ItemDescription/NinePatchRect/Panel/CenterContainer/Panel/item_display".scale = Vector2(0.1,0.1)
	else:
		button_pressed = false
