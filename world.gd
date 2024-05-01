extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	global.Sdialogue.connect(Scam)
	global.Edialogue.connect(Ecam)
	if global.Dialogue == 0:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Entry")	
		global.Dialogue +=1
	if global.minigame_score >= 1000 && global.Dialogue == 1:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "LostFather")
		global.Dialogue +=1	
	if global.minigame_score >= 3000 && global.Dialogue == 2:
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
