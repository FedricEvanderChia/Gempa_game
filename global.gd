extends Node2D

var first = true
var EntryDialogue = 0
var goal = false
var needs = []
var life = 3
var minigame_score = 0
var difficulty = 1
var level = 1
var talker = ""
var invt = preload("res://Inventory/player_inv.tres")

func talking(name):
	talker = name
	
func nextMG():
	if get_tree().paused:
		get_tree().paused = false
	var rng = RandomNumberGenerator.new()
	level +=1
	if level%4 == 0:
		difficulty +=1
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
