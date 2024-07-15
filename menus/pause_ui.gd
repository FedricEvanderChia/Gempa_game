extends Control

@onready var uigempa = $"../"
@onready var sounds_b = $"../button_sounds"
@onready var notif = $notif

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
	notif.modulate = Color(1,1,1,1)
	notif.show()
	var tween = create_tween()
	tween.tween_property(notif,"modulate",Color(1,1,1,1),1)
	tween.tween_property(notif,"modulate",Color(1,1,1,0),1)
	await get_tree().create_timer(2).timeout
	notif.hide()

func _on_back_pressed():
	sounds_b.play()
	$MarginContainer/Settings.hide()
	await get_tree().create_timer(0.5).timeout
