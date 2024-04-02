extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	if global.EntryDialogue == false:
		get_node("GUI").hide()
		DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "Entry")
		get_node("GUI").show()
		global.EntryDialogue == true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_phone_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_119/MG_119.tscn")
	
func _on_player_detection_body_entered(body):
	var tween1 = get_tree().create_tween()
	if body.name == "Player":
		tween1.tween_property(get_node("GUI"),"modulate:a", 0.3, 0.1)




