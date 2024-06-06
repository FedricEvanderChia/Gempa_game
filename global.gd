extends Node2D
var rng = RandomNumberGenerator.new()

var Dialogue = 0
var goal = false
var needs = []
var Lastpos : Vector2
var lastgame : String= ""
var Bridge = "Rusak"
var check_grass= false

var life = 3
var minigame_score = 0
var difficulty = 1
var level = 1
var talker = ""
var quest_status : String = ""
var quest_count : int
var chapter_game= 1
var Recuee = difficulty * 3
var unlockmaze= false
var check_unlockmaze_chapter2= false
var check_unlockmaze_chapter3= false 
var tip = 1

var invt = ResourceLoader.load("res://Inventory/player_inv.tres")
var gold = 0
var workMode = false
var Spos = true
var go_right = false
signal Sdialogue
signal Edialogue
signal Receive(Path)
signal Give(Path)
signal Build
signal flee(chase)

func talking(name):
	talker = name
func reward(item):
	if item == "Jembatan":
		Bridge = "Perbaikan"
		Build.emit()
	else:
		Receive.emit(item)
func submit(item):
	Give.emit(item)
func tips():
	tip = rng.randi_range(1,5)
	DialogueManager.show_dialogue_balloon(load("res://dialogue/Quest.dialogue"), "Trivia"+ String.num(tip))	
func currQuest():
	if quest_status in ["Sembako"]:
		return "Bagikan "+String.num(quest_count)+" "+quest_status+" lagi."
	elif quest_status in ["Dirikan"]:
		return quest_status+" "+String.num(quest_count)+" Tenda lagi."
	elif quest_status in ["Telepon"]:
		return quest_status+" "+String.num(quest_count)+" Nomor Darurat lagi."
	elif quest_status in ["Selamatkan"]:
		return quest_status+" "+String.num(quest_count)+" Orang yang tertimbun reruntuhan lagi."
	else:
		return "Kumpulkan "+String.num(quest_count)+" "+quest_status+" lagi"
func StartDialog():
	Sdialogue.emit()
func EndDialog():
	Edialogue.emit()
	
func nextMG():
	level +=1
	print(level," ",difficulty)
	if (level-1)%4 == 0:
		difficulty +=1
		get_tree().change_scene_to_file("res://Minigames/Difficulty_Increase.tscn")
	else:
		var MG = rng.randi_range(0,3)
		if MG == 0:
			print("Sembako")
			get_tree().change_scene_to_file("res://Minigames/Sembako.tscn")
		elif MG == 1:
			print("Telepon Darurat")
			get_tree().change_scene_to_file("res://Minigames/MG_119/MG_119.tscn")
		elif MG == 2:
			print("Rescue")
			get_tree().change_scene_to_file("res://Minigames/MG_Rescue/MG_Rescue.tscn")
		elif MG == 3:
			print("Tenda")
			get_tree().change_scene_to_file("res://Minigames/MG_Build_EmTent/MG_BuildEmTent.tscn")
