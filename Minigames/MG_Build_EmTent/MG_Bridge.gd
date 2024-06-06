extends Node2D

var target_platpre = preload("res://Minigames/MG_Build_EmTent/target_platform.tscn")
var goal = 8
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
	creat_plat.scale.x = 1 - (8-goal)*0.125
	get_node("platform_target_container").add_child(creat_plat)
	$Actionable_platform/AnimationPlayer.speed_scale = 1

func _process(delta):
	if global.life==0:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://world.tscn")
	if goal == 0:
		global.Dialogue+=1
		global.Bridge = "Selesai"
		get_tree().change_scene_to_file("res://area/area_2.tscn")
		
func _on_area_2d_area_entered(area):
	is_collided = true
func _on_area_2d_area_exited(area):
	is_collided = false
func _on_press_button_pressed():
	if is_collided:
		is_pressed.emit()
		if $Sprite_tent.frame != 8: $Sprite_tent.frame += 1
		goal -=1
		var creat_plat = target_platpre.instantiate()
		creat_plat.position = Vector2(randf_range(349,771), 594 )
		creat_plat.scale.x = 1 - (8-goal)*0.125
		get_node("platform_target_container").add_child(creat_plat)
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
	
