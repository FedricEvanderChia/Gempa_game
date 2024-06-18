extends Node2D

@export var Spos = Vector2(30,498)
@export var Epos = Vector2(4000,498)
# Called when the node enters the scene tree for the first time.
func _ready():
	if global.chapter_game==1 and global.Dialogue >= 3:
		global.chapter_game=2
	if global.Dialogue >= 8:
		$NPC_Layer/Duck.queue_free()
	$player.target = $Sensor_end.position.x
	global.Build.connect(Fixing)
	global.flee.connect(Kabur)
	if  global.Lastpos.x < Epos.x and global.Lastpos.x > Spos.x:
		$player.position = global.Lastpos
	elif global.Spos:
		$player.position = Spos
	elif !global.Spos:
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
func Kabur(kejar):
	if kejar:
		create_tween().tween_property($NPC_Layer/Duck/AnimatedSprite2D,"position", Vector2(-1500,0),3)
		await get_tree().create_timer(3).timeout
		$NPC_Layer/Duck/AnimatedSprite2D.flip_h = true
		create_tween().tween_property($NPC_Layer/Duck/AnimatedSprite2D,"position", Vector2(0,0),3)
		await get_tree().create_timer(3).timeout
		$NPC_Layer/Duck/AnimatedSprite2D.flip_h = false
	else:
		create_tween().tween_property($NPC_Layer/Duck/AnimatedSprite2D,"position", Vector2(-1000,0),3)
		await get_tree().create_timer(3).timeout
		create_tween().tween_property($NPC_Layer/Duck/AnimatedSprite2D,"modulate", Color(1,1,1,0),1)
		await get_tree().create_timer(1).timeout
		$NPC_Layer/Duck.queue_free()
	


func _on_go_to_world_body_entered(body):
	global.Spos = false
	if global.Dialogue == 12:
		global.Dialogue +=1
		get_tree().change_scene_to_file("res://Intro/road_bg_end.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
	
func _on_go_to_world_2_body_entered(body):
	global.Spos = true
	get_tree().change_scene_to_file("res://area/area_3.tscn")



func _on_bridge_fix_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Build_EmTent/MG_Bridge.tscn")


func _on_duck_body_entered(body):
	if body.name == "player" and global.Dialogue == 6:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Sawah1")


func _on_bridge_sensor_body_entered(body):
	print ("Dialog: ",global.Dialogue)
	if body.name == "player" and global.Dialogue == 4:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Bridge1")
	elif body.name == "player" and global.Dialogue == 5:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Bridge2")
	else:
		$Bridge_sensor.queue_free()
		
func _on_sensor_end_body_entered(body):
	global.go_right = false
	if global.quest_status == "Beras":
		global.quest_status = ""
		
func _on_dekat_body_entered(body):
	if body.name == "player" and global.Dialogue == 7:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act2.dialogue"), "Sawah2")
