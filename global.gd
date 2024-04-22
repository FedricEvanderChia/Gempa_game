extends Node2D

var first = true
var EntryDialogue = 0
var goal = false
var needs = []
var life = 3
var minigame_score = 0
var difficulty = 1
var talker = ""

func talking(name):
	talker = name
