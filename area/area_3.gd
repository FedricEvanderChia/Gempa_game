extends Node2D

@export var Spos = Vector2(400,494)
@export var Epos = Vector2(1540,494)
# Called when the node enters the scene tree for the first time.
var item_pos
var item_collectible_dokumen = preload("res://Inventory/items/items_collectibles.tscn")




func _ready():
	if global.Spos == true:
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Scam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",760,1)
func Ecam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",660,1)
		
func dropItem(ItemA, pos):
	var new_drop = item_collectible_dokumen.instantiate()
	new_drop.item = load(ItemA)
	$"collectible_Layer".add_child(new_drop)
	item_pos = new_drop
	item_pos.global_position = Vector2(pos)
	item_pos.scale = Vector2(0.1,0.1)


func _on_go_to_world_body_entered(body):
	global.Spos = false
	if name == "Area3":
		get_tree().change_scene_to_file("res://area/area_2.tscn")
func _on_go_to_world_2_body_entered(body):
	global.Spos = true
	if name == "Area3":
		get_tree().change_scene_to_file("res://area/area_4.tscn")


func _on_kakek_body_entered(body):
		if body.name == "player":
			$NPC_container/Kakek/Talk.show()

func _on_kakek_body_exited(body):
	if body.name == "player":
		$NPC_container/Kakek/Talk.hide()

func _on_talk_pressed():
		print("Search_"+$NPC_container/Kakek.name)
		if(global.Dialogue == 3):
			DialogueManager.show_dialogue_balloon(load("res://dialogue/Act3.dialogue"), "Kakek")
		elif(global.Dialogue == 4):
			DialogueManager.show_dialogue_balloon(load("res://dialogue/Act3.dialogue"), "Mengasih_dokumen")
	#else:
	#	DialogueManager.show_dialogue_balloon(load("res://dialogue/Quest.dialogue"), self.name)

