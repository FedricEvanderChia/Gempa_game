extends Node2D

var pos : Array
var temp_pos : Array
var curr_pos : Marker2D
var direction : Vector2 = Vector2.ZERO

func _ready():
	pos = get_tree().get_nodes_in_group($"../..".name)
	get_pos()
	next_pos()

func _physics_process(delta):
	if global_position.distance_to(curr_pos.position) <= 0.5:
		next_pos()
		
func get_pos():
	temp_pos = pos.duplicate()

func next_pos():
	if temp_pos.is_empty():
		get_pos()
	curr_pos = temp_pos.pop_front()
	direction = to_local(curr_pos.position).normalized()
