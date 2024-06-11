extends Node2D

@export var Spos = Vector2(400,557)
@export var Epos = Vector2(4000,557)
var item_tscn= preload("res://Inventory/items/items_collectibles.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
var item_col

func _ready():	
	if global.chapter_game<1:
		global.chapter_game=1
	global.life = 3
	giveReward()
	global.workMode = false
	if global.Dialogue != 0:
		$DarkScreen.queue_free()
	if  global.Lastpos.x <= Epos.x and global.Lastpos.x >= Spos.x:
		$player.position = global.Lastpos
	elif global.Spos == true:
		$player.position = Spos
	else:
		$player.position = Epos
	global.Sdialogue.connect(Scam)
	global.Edialogue.connect(Ecam)
	if global.Dialogue > 3:
		$Walls/CollisionShape2D3.queue_free()
#	else:
#		$NPCTalk.show()
	if global.Dialogue == 0:
		$DarkScreen.show()
		$DarkScreen.modulate = Color(1, 1, 1, 1)
		create_tween().tween_property($DarkScreen,"modulate",Color(1, 1, 1, 0),1)
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Entry")	
		await get_tree().create_timer(1).timeout
		$DarkScreen.queue_free()
		global.Dialogue +=1
	elif global.minigame_score >= 500 && global.Dialogue == 1:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "LostFather")
		global.Dialogue +=1
	elif global.minigame_score >= 1000 && global.Dialogue == 2:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "FoundPhoto")
		global.Dialogue +=1
		generateItem("res://Inventory/items/Foto.tres",-825)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Scam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",760,1)
func Ecam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",660,1)

func generateItem(ItemA, posX):
	var new_drop = item_tscn.instantiate()
	new_drop.item = load(ItemA)
	get_node("collectible_Layer").add_child(new_drop)
	item_col = new_drop
	item_col.position = Vector2(posX,64)
	item_col.scale = Vector2(0.3,0.3)
	$player.target = item_col.global_position.x
	
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
func _on_mg_exit_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/Maze_menu/Menu_maze.tscn")
func _on_mg_tenda_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Build_EmTent/MG_BuildEmTent.tscn")
func _on_work_pressed():
	global.workMode = true
	global.difficulty = 1
	global.nextMG()

func _on_go_to_sawah_body_entered(body):
	global.Spos = true
	get_tree().change_scene_to_file("res://area/area_2.tscn")

func _on_rescue_body_entered(body):
	if body.name == "player":
		get_node("Rescue/VBoxContainer/Rescue").show()
		if global.unlockmaze:
			get_node("Rescue/VBoxContainer/MG_Exit").show()
func _on_rescue_body_exited(body):
	if body.name == "player":
		get_node("Rescue/VBoxContainer/Rescue").hide()
		if global.unlockmaze:
			get_node("Rescue/VBoxContainer/MG_Exit").hide()

func _on_home_1_body_entered(body):
	if body.name == "player":
		get_node("Home1/Phone").show()
func _on_home_1_body_exited(body):
	if body.name == "player":
		get_node("Home1/Phone").hide()
		
func _on_camp_body_entered(body):
	if body.name == "player":
		get_node("Camp/mg_tenda").show()
func _on_camp_body_exited(body):
	if body.name == "player":
		get_node("Camp/mg_tenda").hide()

func _on_hq_body_entered(body):
	if body.name == "player":
		get_node("HQ/Work").show()
func _on_hq_body_exited(body):
	if body.name == "player":
		get_node("HQ/Work").hide()

func giveReward():
	var itempath
	if global.lastgame == "Sembako":
		var x = rng.randi_range(0,1)
		if x == 0: itempath = "res://Inventory/items/Air.tres"
		elif x == 1: itempath = "res://Inventory/items/Beras.tres"
	elif global.lastgame == "Phone":
		itempath = "res://Inventory/items/P3K.tres"
	elif global.lastgame == "Tenda":
		itempath = "res://Inventory/items/Tenda.tres"
	elif global.lastgame == "Rescue":
		itempath = "res://Inventory/items/Kayu.tres"
	elif global.lastgame == "Maze":
		itempath = "res://Inventory/items/Senter.tres"
	else: return
	global.lastgame = ""
	global.reward(itempath)
