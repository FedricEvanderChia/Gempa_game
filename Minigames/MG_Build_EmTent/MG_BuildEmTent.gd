extends Node2D

var target_platpre = preload("res://Minigames/MG_Build_EmTent/target_platform.tscn")
var goal = 8
var is_state =0
var difficulty = 3
var is_collided = false
signal is_pressed
# Called when the node enters the scene tree for the first time.
func _ready():
	$Actionable_platform/AnimationPlayer.play("move_right_left")
	var creat_plat = target_platpre.instantiate()
	creat_plat.position = Vector2(randf_range(349,771), 594 )
	get_node("platform_target_container").add_child(creat_plat)
	$Actionable_platform/AnimationPlayer.speed_scale += float(global.difficulty*0.2)

func _process(delta):
	if goal == 0:
		get_tree().change_scene_to_file("res://world.tscn")
	
func _on_area_2d_area_entered(area):
	is_collided = true
func _on_area_2d_area_exited(area):
	is_collided = false
func _on_press_button_pressed():
	if is_collided:
		global.minigame_score += 100
		goal -=1
		is_pressed.emit()
		var creat_plat = target_platpre.instantiate()
		creat_plat.position = Vector2(randf_range(349,771), 594 )
		get_node("platform_target_container").add_child(creat_plat)
		if is_state == 0:
			is_state += 1
			$Sprite_tent.texture = ResourceLoader.load("res://asset/Tenda_emergency/Tenda_state_1.png")
		elif is_state == 1:
			is_state += 1
			$Sprite_tent.texture = ResourceLoader.load("res://asset/Tenda_emergency/Tenda_state_2.png")
	else:
		global.life -=1


func _on_help_pressed():
	pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$CanvasLayer/tutorial_ui.visible = new_pause_state
	
func _on_okay_pressed():
	pause()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
