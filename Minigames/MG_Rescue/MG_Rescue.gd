extends Node2D
var rng = RandomNumberGenerator.new()
var rock_tscn= preload("res://Minigames/MG_Rescue/Rock.tscn")
var wood_tscn= preload("res://Minigames/MG_Rescue/wood.tscn")
var pole_tscn= preload("res://Minigames/MG_Rescue/pole.tscn")
var count = rng.randi_range(0, 5)
var sinyal = false
# Called when the node enters the scene tree for the first time.

func _ready():
	var num = global.difficulty+3
	generateRubble(num)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(1.0).timeout
	await sinyal == true
	if GlbRescue.rubble == 0:
		global.minigame_score+=100
		get_tree().change_scene_to_file("res://world.tscn")


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
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
