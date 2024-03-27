extends Control

var num
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Delete").hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num != null:
		$Number.text = num
		get_node("Delete").show()

func _on_call_button_down():
	get_tree().change_scene_to_file("res://world.tscn")

func _on__button_down(extra_arg_0: String):
	if num == null:
		num = extra_arg_0
	else:	
		num = num+extra_arg_0

func _on_star_button_down():
	if num == null:
		num = "*"
	else:	
		num = num+"*"

func _on_hashtag_button_down():
	if num == null:
		num = "#"
	else:	
		num = num+"#"


func _on_delete_pressed():
	if num == null:
		num = null
	else:
		num = num.erase(num.length()-1) 
