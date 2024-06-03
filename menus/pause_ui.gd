extends Control

@onready var uigempa = $"../"
@onready var sounds_b = $button_sounds
func _on_resume_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	uigempa.pause()


func _on_main_menu_pressed():
	
	uigempa.pause()
	get_tree().change_scene_to_file("res://menus/menu.tscn")


func _on_setting_pressed():

	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	uigempa.pause()
	get_tree().change_scene_to_file("res://menus/options.tscn")

func _on_quit_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	uigempa.pause()
	get_tree().quit()


func _on_load_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	util.loadGame()
func _on_save_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	util.saveGame()
