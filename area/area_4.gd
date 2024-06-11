extends Node2D

@export var Spos = Vector2(40,550)
@export var Epos = Vector2(2400,550)
# Called when the node enters the scene tree for the first time.
func _ready():
	if  global.Lastpos.x <= Epos.x and global.Lastpos.x >= Spos.x:
		$player.position = global.Lastpos
	elif global.Spos == true:
		$player.position = Spos
	else:
		$player.position = Epos
	# if global.EntryDialogue == 0:
	# 	DialogueManager.show_dialogue_balloon(load("res://dialogue/EntryDialogue.dialogue"), "Entry")
	# 	global.EntryDialogue +=1
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
	get_tree().change_scene_to_file("res://area/area_3.tscn")


func _on_ayah_body_entered(body):
	$NPC_container/Ayah/Talk.show()

func _on_ayah_body_exited(body):
	$NPC_container/Ayah/Talk.hide()
