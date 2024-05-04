extends Node2D

var vib = 0

func _ready():
	cinema()
	while vib != 3:
		await vibr()
	await create_tween().tween_property($DarkScreen,"modulate",Color(1, 1, 1, 1),1)
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://world.tscn")
func vibr():
	await get_tree().create_timer(2.5).timeout
	var tween = create_tween()
	tween.tween_property($Car,"position", $Car.position - Vector2(0,-10),0.1)
	tween.tween_property($Car,"position", $Car.position - Vector2(0,0),0.1)
	vib+=1
	
	
func cinema():
	print("cinema")
	create_tween().tween_property($Cinematic,"position", Vector2(0,-80),1)
	create_tween().tween_property($Cinematic2,"position", Vector2(0,547),1)
func Uncinema():
	print("Uncinema")
	create_tween().tween_property($Cinematic2,"position", Vector2(0,647),1)
	await create_tween().tween_property($Cinematic,"position", Vector2(0,-180),1)
