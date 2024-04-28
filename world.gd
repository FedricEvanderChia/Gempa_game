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
	var tween1 = get_tree().create_tween()
	if body.name == "Player":
		tween1.tween_property(get_node("GUI"),"modulate:a", 0.3, 0.1)

func _on_phone_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_119/MG_119.tscn")
func _on_rescue_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Rescue/MG_Rescue.tscn")
func _on_load_pressed():
	util.loadGame()
func _on_save_pressed():
	util.saveGame()
