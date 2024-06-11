extends Control
var speed = 300

func _ready():
	if FileAccess.file_exists("res://savegame.bin") == false:
		$VBoxContainer/StartB.hide()
		
func _process(delta):
	$BG.scroll_offset.x -= speed * delta

func _on_start_b_pressed():
	util.loadGame()
	if global.Dialogue == 0:
		get_tree().change_scene_to_file("res://Intro/Intro1.tscn")
	else:
		if global.lastmap == 1: get_tree().change_scene_to_file("res://world.tscn")
		elif global.lastmap == 2: get_tree().change_scene_to_file("res://area/area_2.tscn")
		elif global.lastmap == 3: get_tree().change_scene_to_file("res://area/area_3.tscn")
		elif global.lastmap == 4: get_tree().change_scene_to_file("res://area/area_4.tscn")
		
func _on_option_b_pressed():
	get_tree().change_scene_to_file("res://menus/options.tscn")

func _on_quit_b_pressed():
	get_tree().quit()

func _on_new_game_b_pressed():
	if FileAccess.file_exists("res://savegame.bin") == true:
		$konfirmasi.show()
	else:
		util.ResetGame()
		util.loadGame()
		get_tree().change_scene_to_file("res://Intro/Intro1.tscn")
func _on_yes_pressed():
	util.ResetGame()
	util.loadGame()
	get_tree().change_scene_to_file("res://Intro/Intro1.tscn")
func _on_no_pressed():
	$konfirmasi.hide()
	
func _on_start_b_mouse_entered():
	get_node("VBoxContainer/StartB").scale = Vector2 (1.05,1.05)
func _on_start_b_mouse_exited():
	get_node("VBoxContainer/StartB").scale = Vector2 (1,1)
func _on_option_b_mouse_entered():
	get_node("VBoxContainer/OptionB").scale = Vector2 (1.05,1.05)
func _on_option_b_mouse_exited():
	get_node("VBoxContainer/OptionB").scale = Vector2 (1,1)
func _on_quit_b_mouse_entered():
	get_node("VBoxContainer/QuitB").scale = Vector2 (1.05,1.05)
func _on_quit_b_mouse_exited():
	get_node("VBoxContainer/QuitB").scale = Vector2 (1,1)
func _on_new_game_b_mouse_entered():
	get_node("VBoxContainer/NewGameB").scale = Vector2 (1.05,1.05)
func _on_new_game_b_mouse_exited():
	get_node("VBoxContainer/NewGameB").scale = Vector2 (1,1)



func _on_new_game_b_button_down():
	$VBoxContainer/NewGameB/Label.modulate = Color(0.667, 0.667, 0.667)
func _on_start_b_button_down():
	$VBoxContainer/StartB/Label.modulate = Color(0.667, 0.667, 0.667)
func _on_option_b_button_down():
	$VBoxContainer/OptionB/Label.modulate = Color(0.667, 0.667, 0.667)
func _on_quit_b_button_down():
	$VBoxContainer/QuitB/Label.modulate = Color(0.667, 0.667, 0.667)


func _on_new_game_b_button_up():
	$VBoxContainer/NewGameB/Label.modulate = Color(1,1,1)
func _on_start_b_button_up():
	$VBoxContainer/StartB/Label.modulate = Color(1,1,1)
func _on_option_b_button_up():
	$VBoxContainer/OptionB/Label.modulate = Color(1,1,1)
func _on_quit_b_button_up():
	$VBoxContainer/QuitB/Label.modulate = Color(1,1,1)
