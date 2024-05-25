extends CanvasLayer
var sec = 0
var min = 0
var Dsec = 15
var Dmin = 0
var right_Dpad = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if right_Dpad:
		$Control2.position = Vector2(950,620)
	else:
		$Control2.position = Vector2(0,620)
	reset_timer()
	var time = str(min)+":"+str(sec)
	if sec < 10:
		time = str(min)+":0"+str(sec)
	$Control/times.text = "%s" % time
	$Control/Timer.paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.life==0:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://world.tscn")
	$Control/Axe/Num.text = "%d" % $"../Player".axe
	$Control/Apar/Num.text = "%d" % $"../Player".apar
	if $"../Player".goal == 0:
		$Control/Rescue/Num.position = Vector2(-130,0)
		$Control/Rescue/Num.text = "Korban berhasil diselamatkan\nsegera tinggalkan gedung"
		$Control/Rescue/Num.scale = Vector2(0.75,0.75)
		$Control/Rescue/Rescue.hide()
		$Control/Timer.paused = false
		$Control/times.show()
	else:
		$Control/Rescue/Num.text = "%d" % $"../Player".goal
func _on_back_pressed():
	get_tree().reload_current_scene()

func _on_timer_timeout():
	if $Control/times.modulate == Color(255,0,0):
		$Control/times.modulate = Color(255,255,255)
	else :
		$Control/times.modulate =Color(255,0,0)
	if sec==0:
		if min == 0:
			$Control/times.modulate = Color(255,0,0)
			global.life-=1
			await get_tree().create_timer(1).timeout
			if global.life==0:
				get_tree().change_scene_to_file("res://world.tscn")
			else:	
				if global.workMode:
					global.nextMG()
				else:
					get_tree().change_scene_to_file("res://world.tscn")
		if min>0:
			min -=1
			sec = 60
	sec -= 1
	var time = str(min)+":"+str(sec)
	if sec < 10:
		time = str(min)+":0"+str(sec)
	$Control/times.text = "%s" % time

func reset_timer():
	min = Dmin
	sec = Dsec

func _on_help_pressed():
	pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$tutorial_ui.visible = new_pause_state
	
func _on_okay_pressed():
	pause()
