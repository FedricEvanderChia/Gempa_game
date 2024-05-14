extends Node2D

@export var Spos = Vector2(400,494)
@export var Epos = Vector2(1540,494)
# Called when the node enters the scene tree for the first time.
func _ready():
	if global.Spos == true:
		$player.position = Spos
	else:
		$player.position = Epos
	if global.Dialogue == 4:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Sawah1")
		global.Dialogue +=1
	# if global.minigame_score >= 500 && global.EntryDialogue == 1:
	# 	DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "LostFather")
	# 	global.EntryDialogue +=1	
	#if global.minigame_score >= 3000 && global.EntryDialogue == 2:
	#	DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "FoundPhoto")
	#	global.EntryDialogue +=1
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	



func _on_go_to_world_body_entered(body):
	global.Spos = false
	if name == "Area2":
		get_tree().change_scene_to_file("res://world.tscn")
	if name == "Area3":
		get_tree().change_scene_to_file("res://area/area_2.tscn")
func _on_go_to_world_2_body_entered(body):
	global.Spos = true
	if name == "Area2":
		get_tree().change_scene_to_file("res://area/area_3.tscn")
	if name == "Area3":
		get_tree().change_scene_to_file("res://world.tscn")
