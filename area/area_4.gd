extends Node2D

@export var Spos = Vector2(40,550)
@export var Epos = Vector2(2400,550)
# Called when the node enters the scene tree for the first time.
func _ready():
	global.Sdialogue.connect(Scam)
	global.Edialogue.connect(Ecam)
	$player.target = $Sensor_end.position.x
	if global.Dialogue <= 11:
		$player/Camera2D.limit_right = 1300
	else:
		$Sensor_end.queue_free()
		$player/Camera2D.limit_right = 2508
	if  global.Lastpos.x <= Epos.x and global.Lastpos.x >= Spos.x:
		$player.position = global.Lastpos
	elif global.Spos == true:
		$player.position = Spos
	else:
		$player.position = Epos
	if global.Dialogue == 11:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act4.dialogue"), "Cave1")
		$player.SPEED = 250.0
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_go_to_world_body_entered(body):
	global.Spos = false
	get_tree().change_scene_to_file("res://area/area_3.tscn")


func _on_ayah_body_entered(body):
	if global.Dialogue == 11:
		await get_tree().create_timer(1).timeout
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act4.dialogue"), "Cave3")
	global.go_right = false
	$NPC_container/Ayah/Talk.show()

func _on_ayah_body_exited(body):
	$NPC_container/Ayah/Talk.hide()


func _on_sensor_end_body_entered(body):
	global.go_right = false
	$player.SPEED = 500.0
	create_tween().tween_property($player/Camera2D,"limit_right",2508,5)
	await get_tree().create_timer(5).timeout
	$player.target = $NPC_container/Ayah.position.x
	DialogueManager.show_dialogue_balloon(load("res://dialogue/Act4.dialogue"), "Cave2")
	
func Scam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",800,1)
func Ecam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",717,1)
	$player/Camera2D.position = Vector2(0,0)
