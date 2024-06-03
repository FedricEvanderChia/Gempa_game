extends Node2D

var target_platpre = preload("res://Minigames/MG_Build_EmTent/target_platform.tscn")
var goal = 4
var is_state =0
var difficulty = 1
var is_collided = false
@onready var sounds_b = $button_sounds
signal is_pressed
# Called when the node enters the scene tree for the first time.
func _ready():
	if global.life<=0:
		global.life = 3
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
		add_score(100)
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
		
func add_time(val):
	$AddTime.text = "+%d" % val
	$CanvasLayer/Control.sec += val
	$AddTime.show()
	$AddTime.position = Vector2(575,20)
	$AddTime.modulate = Color(1, 1, 1, 1)
	create_tween().tween_property($AddTime,"position",Vector2(575,0),1)
	create_tween().tween_property($AddTime,"modulate", Color(1, 1, 1, 0),1)

func add_score(val):
	$AddScore.text = "+%d" % val
	global.minigame_score += val
	$AddScore.show()
	$AddScore.position = Vector2(330,20)
	$AddScore.modulate = Color(1, 1, 1, 1)
	create_tween().tween_property($AddScore,"position",Vector2(330,0),1)
	create_tween().tween_property($AddScore,"modulate", Color(1, 1, 1, 0),1)
	
func _on_help_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$CanvasLayer/tutorial_ui.visible = new_pause_state
	
func _on_okay_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	pause()

func _on_back_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://world.tscn")
