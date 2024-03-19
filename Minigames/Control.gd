extends Control

var min = 0
var sec = 0
var Dmin = 0
var Dsec = 30

func _ready():
	reset_timer()
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
	sec = Dsec
