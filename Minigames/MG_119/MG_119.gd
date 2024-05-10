extends Node2D
var rng = RandomNumberGenerator.new()
var condition = null
var openBook = false
var Req
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Situation.modulate = Color(255,255,255)
	if global.life<=0:
		global.life = 3
	$CanvasLayer/Control/Success.hide()
	generateOrder()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.life == 0:
		await get_node("CanvasLayer/Control/lifes/life1/AnimationPlayer").animation_finished
	
func generateOrder():
	var obj
	if global.difficulty >= 5:
		obj = rng.randi_range(0, 7)
		if obj == 7:
			$CanvasLayer/Control.Dsec = 10
	else:
		obj = rng.randi_range(0, 6)
	if obj == 0:
		condition = "118" # Ambulans
		Req = "Telepon Ambulans (118)"
	elif obj == 1:
		condition = "113" # Kebakaran
		Req = "Telepon Kebakaran (113)"
	elif obj == 2:
		condition = "110" # Kepolisian
		Req = "Telepon Kepolisian (110)"
	elif obj == 3:
		condition = "115" # Basarnas
		Req = "Telepon Basarnas (115)"
	elif obj == 4:
		condition = "129" # Posko bencana
		Req = "Telepon Posko bencana (129)"
	elif obj == 5:
		condition = "122" # Posko Kewaspadaan Nasional
		Req = "Telepon Posko Kewaspadaan Nasional (122)"
	elif obj == 6:
		condition = "123" # Gangguan Kelistrikan
		Req = "Telepon Gangguan Kelistrikan (123)"
	elif obj == 7:
		condition = "0217992325" # untuk Palang Merah Indonesia (PMI)
		Req = "Telepon Palang Merah Indonesia (021-7992325)"
	if global.difficulty >= 5:
		Req = Req.left(Req.find("("))
	$Situation.text = Req
	
func _on_call_button_down():
	var num = get_node("Phone/Number")
	if num.text == condition:
		$Situation.modulate = Color(0,255,0)
		get_node("Phone").num= ""
		complete()
	else:
		get_node("Phone").num= ""
		if !$Situation.text.contains("TRY AGAIN"):
			$Situation.text = $Situation.text + "\nTRY AGAIN"
		global.minigame_score -= 50 
		global.life -= 1
		wrong()
		
func wrong():
	$Situation.modulate = Color(255,0,0)
	await get_tree().create_timer(0.15).timeout
	$Situation.modulate = Color(255,255,255)
	await get_tree().create_timer(0.15).timeout
	$Situation.modulate = Color(255,0,0)
	await get_tree().create_timer(0.15).timeout
	$Situation.modulate = Color(255,255,255)
	await get_tree().create_timer(0.15).timeout
	$Situation.modulate = Color(255,0,0)
	await get_tree().create_timer(0.15).timeout
	$Situation.modulate = Color(255,255,255)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	global.workMode = false
func complete():
	global.minigame_score += 100 
	$CanvasLayer/Control/Success.show()
	await get_tree().create_timer(1).timeout
	if global.workMode:
		global.nextMG()
	else:
		get_tree().change_scene_to_file("res://world.tscn")

func _on_phone_book_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if openBook:
			get_node("PhoneBook/list").hide()
			get_node("PhoneBook/AnimatedSprite2D").play("Close")
			create_tween().tween_property($Phone,"position",Vector2(577,420),0.5)
			await get_node("PhoneBook/AnimatedSprite2D").animation_finished
			openBook = false
		elif openBook == false:	
			get_node("PhoneBook/AnimatedSprite2D").play("Open")
			create_tween().tween_property($Phone,"position",Vector2(800,420),0.5)
			await get_node("PhoneBook/AnimatedSprite2D").animation_finished
			get_node("PhoneBook/list").show()
			$Phone.position = Vector2(800,420)
			openBook = true


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
