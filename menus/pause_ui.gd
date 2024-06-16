extends Control

@onready var uigempa = $"../"
@onready var sounds_b = $"../button_sounds"
func _on_resume_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	uigempa.pause()


func _on_main_menu_pressed():
	sounds_b.play()
	uigempa.pause()
	get_tree().change_scene_to_file("res://menus/menu.tscn")


func _on_setting_pressed():
	sounds_b.play()
	$MarginContainer/Settings.show()
	await get_tree().create_timer(0.5).timeout
	

func _on_quit_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	uigempa.pause()
	get_tree().quit()

func _on_save_pressed():
	global.lastmap = int($"../../".name.right(1))
	sounds_b.play()
	util.saveGame()
	await get_tree().create_timer(0.5).timeout


func _on_back_pressed():
	sounds_b.play()
	$MarginContainer/Settings.hide()
	await get_tree().create_timer(0.5).timeout
