extends Control
var speed = 300

func _process(delta):
	$BG.scroll_offset.x -= speed * delta

func _on_start_b_pressed():
	util.loadGame()
	if global.Dialogue == 0:
		get_tree().change_scene_to_file("res://Intro/Intro1.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
		
func _on_option_b_pressed():
	get_tree().change_scene_to_file("res://menus/options.tscn")

func _on_quit_b_pressed():
	get_tree().quit()

func _on_new_game_b_pressed():
	util.emptyInv()
	if global.Dialogue == 0:
		get_tree().change_scene_to_file("res://Intro/Intro1.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
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
