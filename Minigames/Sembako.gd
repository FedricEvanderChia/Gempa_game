extends Node2D
class_name Sembako
#signal need(value)

var NPC_tscn= preload("res://NPC/NPC.tscn")
var rng = RandomNumberGenerator.new()
var customer = null
var selected = false
var needs = []
var goal = 5 + global.difficulty*5
var newscore = global.minigame_score+100
# Called when the node enters the scene tree for the first time.
func _ready():
	if global.workMode:
		goal = global.difficulty
	if global.life<=0:
		global.life = 3
	$CanvasLayer/Control/Success.hide()
	
func _process(delta):
	$CanvasLayer/Control/antrian.text = "Antrian\n%d" % goal
	if customer == null:
		if goal != 0:
			await generateOrder()
			await generateNPC()
		else:
			complete()

func generateNPC():
	var new_cust = NPC_tscn.instantiate()
	new_cust.position = get_global_position()
	get_node("NPC_Layer").add_child(new_cust)
	customer = new_cust
			
func generateOrder():
	var num
	if global.workMode:
		if global.difficulty < 3:
			num = 1
		elif global.difficulty >= 3:
			num = rng.randi_range(1, 2)
		elif global.difficulty >= 10:
			num = rng.randi_range(1, 3)
	else:
		num = rng.randi_range(1, 3)
	for number in range(num):
		var obj = rng.randi_range(0, 3)
		if obj == 0:
			needs.insert (number,"Beras")
		elif obj == 1:
			needs.insert (number,"Air")
		elif obj == 2:
			needs.insert (number,"Tenda")
		elif obj == 3:
			needs.insert (number,"P3K")
	for number in range(0,needs.size()):
		print(needs[number])
	#emit_signal("need",needs)
	global.needs = needs

func complete():
	$CanvasLayer/Control/Success.show()
	await get_tree().create_timer(1).timeout
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
