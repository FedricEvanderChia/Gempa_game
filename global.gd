extends Node2D
const SAVE_PATH = "res://savegame.bin"
const SAVE_INV = "res://saveinv.bin"
var Dialogue = 0
var goal = false
var needs = []
var life = 3
var minigame_score = 0
var difficulty = 1
var level = 1
var talker = ""
var gold = 0
var inv : Array[inventory_slot]

var workMode = false
var Spos = true

var maze_size = 9
signal fringe_changed

signal Sdialogue
signal Edialogue
func talking(name):
	talker = name
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
			
func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(Dialogue)
	file.store_var(life)
	file.store_var(minigame_score)
	#file.store_var(inv)
	
func loadGame():
	if FileAccess.file_exists(SAVE_PATH):
		print("file found")
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		Dialogue = file.get_var()
		life = file.get_var()
		minigame_score = file.get_var()
		
		#inv = file.get_var()
	else:
		print("file not found")

func saveInv(slot: inventory_slot) -> void:
	var config_file := ConfigFile.new()
	config_file.set_value("Inventory", "slot", slot)

	var error := config_file.save(SAVE_INV)
	if error:
		print("An error happened while saving data: ", error)

# To load data
func loadInv() -> void:
	var config_file := ConfigFile.new()
	var error := config_file.load(SAVE_INV)
	if error:
		print("An error happened while loading data: ", error)
		return
	inv = config_file.get_value("Inventory", "slot", null)
