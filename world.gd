extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	if global.EntryDialogue == 0:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "Entry")
		global.EntryDialogue +=1
	if global.minigame_score >= 500 && global.EntryDialogue == 1:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "LostFather")
		global.EntryDialogue +=1	
	if global.minigame_score >= 3000 && global.EntryDialogue == 2:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "FoundPhoto")
		global.EntryDialogue +=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func _on_player_detection_body_entered(body):
	if body.name == "player":
		get_node("GUI/Control2/tc_button_left").modulate = Color(1, 1, 1, 0.5)
		get_node("GUI/Control2/tc_button_right").modulate = Color(1, 1, 1, 0.5)
func _on_player_detection_body_exited(body):
	if body.name == "player":
		get_node("GUI/Control2/tc_button_left").modulate = Color(1, 1, 1, 1)
		get_node("GUI/Control2/tc_button_right").modulate = Color(1, 1, 1, 1)

func _on_phone_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_119/MG_119.tscn")
func _on_rescue_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Rescue/MG_Rescue.tscn")

func _on_rescue_body_entered(body):
	get_node("Rescue/Rescue").show()

func _on_rescue_body_exited(body):
	get_node("Rescue/Rescue").hide()
