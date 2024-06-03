extends Control

var min = 0
var sec = 0
var Dmin = 0
var Dsec = 15
@onready var MG = $"../../"

func _ready():
	$times.modulate = Color(255,255,255)
	reset_timer()
	var time = str(min)+":"+str(sec)
	if sec < 10:
		time = str(min)+":0"+str(sec)
	$times.text = "%s" % time
	pass


func _process(delta):
	if global.life==0:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://world.tscn")
	$scoretext.text = "Score: %d" % global.minigame_score
	pass


func _on_timer_timeout():
	if sec==0:
		if min == 0:
			$times.modulate = Color(255,0,0)
			global.life-=1
			await get_tree().create_timer(1).timeout
			if global.life==0:
				get_tree().change_scene_to_file("res://world.tscn")
				global.difficulty = $"../..".reset
			else:	
				if global.workMode:
					global.nextMG()
				else:
					#if MG.name == "MG_Rescue":
					#	global.minigame_score -= 50
					#	MG.get_tree().reload_current_scene()
					#else:
						get_tree().change_scene_to_file("res://world.tscn")
		if min>0:
			min -=1
			sec = 60
	sec -= 1
	var time = str(min)+":"+str(sec)
	if sec < 10:
		time = str(min)+":0"+str(sec)
	$times.text = "%s" % time

func reset_timer():
	min = Dmin
	sec = Dsec-global.difficulty
	if sec<=5:
		sec=5
		
