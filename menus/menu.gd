extends Control
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	util.loadGame()


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$BG.scroll_offset.x -= speed * delta

func _on_start_b_pressed():
	if global.Dialogue == 0:
		get_tree().change_scene_to_file("res://Intro/Intro1.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
		
func _on_option_b_pressed():
	get_tree().change_scene_to_file("res://menus/options.tscn")

func _on_quit_b_pressed():
	get_tree().quit()

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
