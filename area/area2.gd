extends Node2D

@export var Spos = Vector2(30,498)
@export var Epos = Vector2(4000,498)
# Called when the node enters the scene tree for the first time.
func _ready():
	global.Build.connect(Fixing)
	if global.Spos == true:
		$player.position = Spos
	else:
		$player.position = Epos
	Fixing()
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

	
func Fixing():
	if global.Bridge == "Selesai":
		$BG2/ParallaxLayer2/Prlx1Sawah.frame = 1
		$StaticBody2D2/Bridge.queue_free()
		$Bridge.show()
		$BridgeFix.hide()
	elif global.Bridge == "Perbaikan":
		$BG2/ParallaxLayer2/Prlx1Sawah.frame = 0
		$Bridge.hide()
		$BridgeFix.show()
	else: 
		$BG2/ParallaxLayer2/Prlx1Sawah.frame = 0
		$Bridge.hide()
		$BridgeFix.hide()


func _on_go_to_world_body_entered(body):
	global.Spos = false
	if name == "Area2":
		get_tree().change_scene_to_file("res://world.tscn")
	if name == "Area3":
		get_tree().change_scene_to_file("res://area/area2.tscn")
func _on_go_to_world_2_body_entered(body):
	global.Spos = true
	if name == "Area2":
		get_tree().change_scene_to_file("res://area/area_3.tscn")
	if name == "Area3":
		get_tree().change_scene_to_file("res://world.tscn")


func _on_bridge_fix_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Build_EmTent/MG_Bridge.tscn")


func _on_duck_body_entered(body):
	if body.name == "player":
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Sawah1")
		global.Dialogue +=1
	


func _on_bridge_sensor_body_entered(body):
	print ("Dialog: ",global.Dialogue)
	if body.name == "player" and global.Dialogue == 4:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Bridge1")
	elif body.name == "player" and global.Dialogue == 5:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Bridge2")
		global.Dialogue +=1
	else:
		$Bridge_sensor.queue_free()
		
func _on_sensor_end_body_entered(body):
	global.go_right = false
