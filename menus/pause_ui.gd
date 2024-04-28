extends Control

@onready var uigempa = $"../"

func _on_resume_pressed():
	uigempa.pause()


func _on_main_menu_pressed():
	uigempa.pause()
	get_tree().change_scene_to_file("res://menus/menu.tscn")


func _on_setting_pressed():
	uigempa.pause()
	get_tree().change_scene_to_file("res://menus/options.tscn")


func _on_quit_pressed():
	uigempa.pause()
	get_tree().quit()


func _on_load_pressed():
	util.loadGame()
func _on_save_pressed():
	util.saveGame()
