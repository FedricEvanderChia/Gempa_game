extends Node2D
var rng = RandomNumberGenerator.new()
var rock_tscn= preload("res://Minigames/MG_Rescue/Rock.tscn")
var wood_tscn= preload("res://Minigames/MG_Rescue/wood.tscn")
var count = rng.randi_range(0, 5)
# Called when the node enters the scene tree for the first time.

func _ready():
	generateRubble()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func generateRubble():
	
	var obj = rng.randi_range(0, 1)
	if obj == 0:
		var rub = rock_tscn.instantiate()
		rub.position = Vector2(rng.randi_range(-150,150),rng.randi_range(-150,150))
		get_node(".").add_child(rub)
	elif obj == 1:
		var rub = wood_tscn.instantiate()
		rub.position = Vector2(rng.randi_range(-150,150),rng.randi_range(-150,150))
		get_node(".").add_child(rub)

func _on_clear_area_body_exited(body):
	if body:
		get_tree().change_scene_to_file("res://world.tscn")
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")



