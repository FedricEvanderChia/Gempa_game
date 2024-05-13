extends Node2D

var first = true
var Dialogue = 0
var goal = false
var needs = []
var life = 3
var minigame_score = 0
var difficulty = 1
var level = 1
var talker = ""
var invt = preload("res://Inventory/player_inv.tres")
var gold = 0
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
		var MG = rng.randi_range(0,2)
		if MG == 0:
			print("Sembako")
			get_tree().change_scene_to_file("res://Minigames/Sembako.tscn")
		elif MG == 1:
			print("Telepon Darurat")
			get_tree().change_scene_to_file("res://Minigames/MG_119/MG_119.tscn")
		elif MG == 2:
			print("Rescue")
			get_tree().change_scene_to_file("res://Minigames/MG_Rescue/MG_Rescue.tscn")	
