extends Node2D

var Dialogue = 3
var goal = false
var needs = []
var Lastpos : Vector2
var lastgame : String= ""
var Bridge = "Rusak"

var life = 3
var minigame_score = 0
var difficulty = 1
var level = 1
var talker = ""
var quest_status : String = ""
var quest_count : int
var chapter_game= 2
var Recuee = difficulty * 3
var check_unlockmaze_chapter2= false
var check_unlockmaze_chapter3= false 
var check_grass= false
							#maze1	#maze2	#maze3 #maze4 #maze5   #maze6 #maze7 #maze8  #maze9  #maze10  #maze11 #maze12  #maze13 #maze14 #maze15 #maze16 #maze17 #maze18 #maze19  #maze20       
var check_maze_level_condition = [false, false, false,  false,  false,  false, false, false,  false,  false,  false, false,  false, false, false, false, false, false,  false,  false,   false]


var current_area_player = 0
var current_player_position = 0

var invt = ResourceLoader.load("res://Inventory/player_inv.tres")
var gold = 0
var workMode = false
var Spos = true
var go_right = false
signal Sdialogue
signal Edialogue
signal Receive(Path)
signal Give(Path)

func talking(name):
	talker = name
func reward(item):
	if item == "Jembatan":
		Bridge = "Perbaikan"
	else:
		Receive.emit(item)

func submit(item):
	Give.emit(item)




func StartDialog():
	Sdialogue.emit()
func EndDialog():
	Edialogue.emit()

func nextMG():
	var rng = RandomNumberGenerator.new()
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
