extends Node2D
class_name Sembako
#signal need(value)

var women_tscn= preload("res://NPC/NPC_women.tscn")
var man_tscn= preload("res://NPC/npc_man.tscn")
var girl_tscn= preload("res://NPC/npc_girl.tscn")
var boy_tscn= preload("res://NPC/npc_boy.tscn")
var rng = RandomNumberGenerator.new()
var customer = null
var selected = false
var needs = []
# Called when the node enters the scene tree for the first time.
func _ready():
	if global.life<=0:
		global.life = 3
	pass
func _process(delta):
	if global.life == 0:
		await get_node("CanvasLayer/Control/lifes/life1/AnimationPlayer").animation_finished
	if customer == null:
		generateNPC()
		await generateNPC()
		generateOrder()
	if selected:
		followMouse()

func generateNPC():
	if customer == null:
		var num = rng.randi_range(0, 3)
		if num == 0: 
			var new_cust = women_tscn.instantiate()
			new_cust.position = get_global_position()
			get_node("NPC_Layer").add_child(new_cust)
			customer = new_cust
		elif num == 1: 
			var new_cust = man_tscn.instantiate()
			new_cust.position = get_global_position()
			get_node("NPC_Layer").add_child(new_cust)
			customer = new_cust
		elif num == 2: 
			var new_cust = girl_tscn.instantiate()
			new_cust.position = get_global_position()
			get_node("NPC_Layer").add_child(new_cust)
			customer = new_cust
		elif num == 3: 
			var new_cust = boy_tscn.instantiate()
			new_cust.position = get_global_position()
			get_node("NPC_Layer").add_child(new_cust)
			customer = new_cust
			
func generateOrder():
	var num = rng.randi_range(1, 3)
	for number in range(num):
		var obj = rng.randi_range(0, 2)
		if obj == 0:
			needs.insert (number,"Beras")
		elif obj == 1:
			needs.insert (number,"Air")
		elif obj == 2:
			needs.insert (number,"Tenda")
	for number in range(0,needs.size()):
		print(needs[number])
	#emit_signal("need",needs)
	global.needs = needs

func followMouse():
	position = get_local_mouse_position()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

