extends ParallaxBackground

var speed = 750
# Called when the node enters the scene tree for the first time.
func _process(delta):
	scroll_offset.x += speed * delta

var vib = true

func _ready():
	global.Build.connect(ending)
	cinema()
	DialogueManager.show_dialogue_balloon(load("res://dialogue/Act4.dialogue"), "Outro")
	while vib:
		await vibr()
	await create_tween().tween_property($DarkScreen,"modulate",Color(1, 1, 1, 1),1)
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://world.tscn")
func ending():
	vib = false

func vibr():
	await get_tree().create_timer(2).timeout
	var tween = create_tween()
	tween.tween_property($Car,"position", $Car.position - Vector2(0,-10),0.1)
	tween.tween_property($Car,"position", $Car.position - Vector2(0,0),0.1)
	
func cinema():
	print("cinema")
	create_tween().tween_property($Cinematic,"position", Vector2(0,-80),1)
	create_tween().tween_property($Cinematic2,"position", Vector2(0,547),1)
func Uncinema():
	print("Uncinema")
	create_tween().tween_property($Cinematic2,"position", Vector2(0,647),1)
	await create_tween().tween_property($Cinematic,"position", Vector2(0,-180),1)
