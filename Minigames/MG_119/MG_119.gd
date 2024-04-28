extends Node2D
var rng = RandomNumberGenerator.new()
var condition = null
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
	var obj = rng.randi_range(0, 7)
	if obj == 0:
		condition = "118" # Ambulans
		$Situation.text = "Telepon Ambulans (118)"
	elif obj == 1:
		condition = "113" # Kebakaran
		$Situation.text = "Telepon Kebakaran (113)"
	elif obj == 2:
		condition = "110" # Kepolisian
		$Situation.text = "Telepon Kepolisian (110)"
	elif obj == 3:
		condition = "115" # Basarnas
		$Situation.text = "Telepon Basarnas (115)"
	elif obj == 4:
		condition = "129" # Posko bencana
		$Situation.text = "Telepon Posko bencana (129)"
	elif obj == 5:
		condition = "122" # Posko Kewaspadaan Nasional
		$Situation.text = "Telepon Posko Kewaspadaan Nasional (122)"
	elif obj == 6:
		condition = "123" # Gangguan Kelistrikan
		$Situation.text = "Telepon Gangguan Kelistrikan (123)"
	elif obj == 7:
		condition = "0217992325" # untuk Palang Merah Indonesia (PMI)
		$Situation.text = "Telepon Palang Merah Indonesia (021-7992325)"

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

func complete():
	global.minigame_score+=100
	$CanvasLayer/Control/Success.show()
	await get_tree().create_timer(1).timeout
	global.nextMG()
