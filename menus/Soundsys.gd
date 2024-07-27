extends Control

func _on_back_pressed():
	$".".hide()
	var file = FileAccess.open("user://SoundSys.bin", FileAccess.WRITE)
	var data: Dictionary = {
		"Master" = $MarginContainer/VBoxContainer/HSlider.value,
		"Music" = $MarginContainer/VBoxContainer/HSlider2.value,
		"SFX" = $MarginContainer/VBoxContainer/HSlider3.value
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
