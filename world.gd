extends Node2D

@export var Spos = Vector2(400,557)
@export var Epos = Vector2(4000,557)
# Called when the node enters the scene tree for the first time.
func _ready():	
	global.workMode = false
	if global.Dialogue != 0:
		$DarkScreen.queue_free()
	if global.Spos == true:
		$player.position = Spos
	else:
		$player.position = Epos
	global.Sdialogue.connect(Scam)
	global.Edialogue.connect(Ecam)
	if global.Dialogue < 3:
		$NPCTalk.hide()
	else:
		$NPCTalk.show()
	if global.Dialogue == 0:
		$DarkScreen.show()
		$DarkScreen.modulate = Color(1, 1, 1, 1)
		var tween = create_tween()
		tween.tween_property($DarkScreen,"modulate",Color(1, 1, 1, 0),1)
		tween.tween_callback(queue_free)
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Entry")	
		global.Dialogue +=1
	elif global.minigame_score >= 500 && global.Dialogue == 1:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "LostFather")
		global.Dialogue +=1	
	elif global.minigame_score >= 1000 && global.Dialogue == 2:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "FoundPhoto")
		global.Dialogue +=1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Scam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",760,1)
func Ecam():
	create_tween().tween_property($player/Camera2D,"limit_bottom",660,1)

func _process(delta):
	pass

	
func _on_player_detection_body_entered(body):
	if body.name == "player":
		get_node("GUI/Control2/tc_button_left").modulate = Color(1, 1, 1, 0.5)
		get_node("GUI/Control2/tc_button_right").modulate = Color(1, 1, 1, 0.5)
func _on_player_detection_body_exited(body):
	if body.name == "player":
		get_node("GUI/Control2/tc_button_left").modulate = Color(1, 1, 1, 1)
		get_node("GUI/Control2/tc_button_right").modulate = Color(1, 1, 1, 1)

func _on_phone_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_119/MG_119.tscn")
func _on_rescue_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Rescue/MG_Rescue.tscn")
func _on_mg_exit_pressed():
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze.tscn")
func _on_work_pressed():
	global.workMode = true
	global.nextMG()
	
	
func _on_rescue_body_entered(body):
	get_node("Rescue/Rescue").show()
func _on_rescue_body_exited(body):
	get_node("Rescue/Rescue").hide()
func _on_work_mode_body_entered(body):
	get_node("WorkMode/Work").show()
func _on_work_mode_body_exited(body):
	get_node("WorkMode/Work").hide()


func _on_go_to_sawah_body_entered(body):
	global.Spos = true
	get_tree().change_scene_to_file("res://area/area_2.tscn")
