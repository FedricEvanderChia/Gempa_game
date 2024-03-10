extends Node2D
class_name Customer_generator

var women_tscn= preload("res://NPC/NPC_women.tscn")
var man_tscn= preload("res://NPC/npc_man.tscn")
var girl_tscn= preload("res://NPC/npc_girl.tscn")
var boy_tscn= preload("res://NPC/npc_boy.tscn")

var customer = null
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if customer == null:
		var num = rng.randi_range(0, 3)
		if num == 0: 
			var new_cust = women_tscn.instantiate()
			new_cust.position = get_global_position()
			self.add_child(new_cust)
			customer = new_cust
		elif num == 1: 
			var new_cust = man_tscn.instantiate()
			new_cust.position = get_global_position()
			self.add_child(new_cust)
			customer = new_cust
		elif num == 2: 
			var new_cust = girl_tscn.instantiate()
			new_cust.position = get_global_position()
			self.add_child(new_cust)
			customer = new_cust
		elif num == 3: 
			var new_cust = boy_tscn.instantiate()
			new_cust.position = get_global_position()
			self.add_child(new_cust)
			customer = new_cust

