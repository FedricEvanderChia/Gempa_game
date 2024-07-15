extends Control
var speed = 300

func _ready():
	loadSound()
	if FileAccess.file_exists(util.SAVE_PATH) == false:
		$MarginContainer/VBoxContainer/StartB.hide()
		util.emptyInv()
		
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
	$Settings.show()

func _on_quit_b_pressed():
	get_tree().quit()

func _on_new_game_b_pressed():
	if FileAccess.file_exists(util.SAVE_PATH) == true:
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
	get_node("MarginContainer/VBoxContainer/StartB").scale = Vector2 (1.05,1.05)
func _on_start_b_mouse_exited():
	get_node("MarginContainer/VBoxContainer/StartB").scale = Vector2 (1,1)
func _on_option_b_mouse_entered():
	get_node("MarginContainer/VBoxContainer2/OptionB").scale = Vector2 (1.05,1.05)
func _on_option_b_mouse_exited():
	get_node("MarginContainer/VBoxContainer2/OptionB").scale = Vector2 (1,1)
func _on_quit_b_mouse_entered():
	get_node("MarginContainer/VBoxContainer2/QuitB").scale = Vector2 (1.05,1.05)
func _on_quit_b_mouse_exited():
	get_node("MarginContainer/VBoxContainer2/QuitB").scale = Vector2 (1,1)
func _on_new_game_b_mouse_entered():
	get_node("MarginContainer/VBoxContainer/NewGameB").scale = Vector2 (1.05,1.05)
func _on_new_game_b_mouse_exited():
	get_node("MarginContainer/VBoxContainer/NewGameB").scale = Vector2 (1,1)

func _on_back_pressed():
	$Settings.hide()
	var file = FileAccess.open("user://SoundSys.bin", FileAccess.WRITE)
	var data: Dictionary = {
		"Master" = $Settings/MarginContainer/VBoxContainer/HSlider.value,
		"Music" = $Settings/MarginContainer/VBoxContainer/HSlider2.value,
		"SFX" = $Settings/MarginContainer/VBoxContainer/HSlider3.value
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)

func loadSound():
	var file = FileAccess.open("user://SoundSys.bin", FileAccess.READ)
	if FileAccess.file_exists("user://SoundSys.bin") == true:
		if not file.eof_reached():
			var curr_line = JSON.parse_string(file.get_line())
			if curr_line:
				$Settings/MarginContainer/VBoxContainer/HSlider.value = curr_line["Master"]
				$Settings/MarginContainer/VBoxContainer/HSlider2.value = curr_line["Music"]
				$Settings/MarginContainer/VBoxContainer/HSlider3.value = curr_line["SFX"]
