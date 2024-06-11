extends Node2D
var rng = RandomNumberGenerator.new()
var rock_tscn= preload("res://Minigames/MG_Rescue/Rock.tscn")
var wood_tscn= preload("res://Minigames/MG_Rescue/wood.tscn")
var pole_tscn= preload("res://Minigames/MG_Rescue/pole.tscn")
var count = rng.randi_range(0, 5)
var newscore = global.minigame_score+100 
var once = true
# Called when the node enters the scene tree for the first time.
var num = 5 + global.difficulty*2
var reset
func _ready():
	reset = global.difficulty
	if global.workMode:
		$CanvasLayer/Control/antrian.hide()
	if global.life<=0:
		global.life = 3
	$CanvasLayer/Control/Success.hide()
	await generateRubble(num)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Control/antrian.text = "Korban\n%d" % global.Recuee
	await get_tree().create_timer(0.3).timeout
	print(GlbRescue.rubble)
	
	if GlbRescue.rubble == 0 and once and $CanvasLayer/Control.sec > 0 :
		once = false
		complete()
	else:
		pass

func generateRubble(num):
	for number in range(num):
		var obj = rng.randi_range(0, 2)
		var pos = get_node("ClearArea/CollisionShape2D").position
		if obj == 0:
			var rub = rock_tscn.instantiate()
			rub.position = Vector2(rng.randi_range(-150,150),rng.randi_range(-150,150))+pos
			rub.rotation = rng.randi_range(-180,180)
			get_node("ClearArea").add_child(rub)
		elif obj == 1:
			var rub = wood_tscn.instantiate()
			rub.position = Vector2(rng.randi_range(-150,150),rng.randi_range(-150,150))+pos
			rub.rotation = rng.randi_range(-180,180)
			get_node("ClearArea").add_child(rub)
		elif obj == 2:
			var rub = pole_tscn.instantiate()
			rub.position = Vector2(rng.randi_range(-150,150),rng.randi_range(-150,150))+pos
			rub.rotation = rng.randi_range(-180,180)
			get_node("ClearArea").add_child(rub)

func complete():
	add_score(100)
	$CanvasLayer/Control/Success.show()
	await get_tree().create_timer(1).timeout
	get_tree().paused = false
	if global.workMode:
		global.nextMG()
	else:
		if global.Recuee <= 1:
			global.Recuee = global.difficulty * 5
			global.lastgame = "Rescue"
			get_tree().change_scene_to_file("res://world.tscn")
		else:
			global.Recuee -= 1
			get_tree().reload_current_scene()

func add_score(val):
	$AddScore.text = "+%d" % val
	global.minigame_score += val
	$AddScore.show()
	$AddScore.position = Vector2(330,20)
	$AddScore.modulate = Color(1, 1, 1, 1)
	create_tween().tween_property($AddScore,"position",Vector2(330,0),1)
	create_tween().tween_property($AddScore,"modulate", Color(1, 1, 1, 0),1)

func _on_help_pressed():
	pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$CanvasLayer/tutorial_ui.visible = new_pause_state
	
func _on_okay_pressed():
	pause()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
