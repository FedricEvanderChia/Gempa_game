extends Node2D
class_name Customer_generator

var women_tscn= preload("res://Object/NPC_women.tscn")
var man_tscn= preload("res://Object/npc_man.tscn")
var customer = null
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if customer == null:
		var num = rng.randi_range(0, 1)
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
func _benar():
	self.queue_free()

