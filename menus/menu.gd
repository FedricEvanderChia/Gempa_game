extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_b_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_option_b_pressed():
	get_tree().change_scene_to_file("res://options.tscn")


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
