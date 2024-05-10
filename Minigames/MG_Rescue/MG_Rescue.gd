extends Node2D
var rng = RandomNumberGenerator.new()
var rock_tscn= preload("res://Minigames/MG_Rescue/Rock.tscn")
var wood_tscn= preload("res://Minigames/MG_Rescue/wood.tscn")
var pole_tscn= preload("res://Minigames/MG_Rescue/pole.tscn")
var count = rng.randi_range(0, 5)
var newscore = global.minigame_score+100 
# Called when the node enters the scene tree for the first time.

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	if global.life<=0:
		global.life = 3
	$CanvasLayer/Control/Success.hide()
	var num = global.difficulty+3
	generateRubble(num)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(1.0).timeout
	if GlbRescue.rubble == 0:
		get_tree().paused = true
		complete()
	


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
	global.minigame_score = newscore
	$CanvasLayer/Control/Success.show()
	await get_tree().create_timer(1).timeout
	get_tree().paused = false
	if global.workMode:
		global.nextMG()
	else:
		get_tree().change_scene_to_file("res://world.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	
func _on_help_pressed():
	pause()
	
func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$CanvasLayer/tutorial_ui.visible = new_pause_state

func _on_okay_pressed():
	pause()
