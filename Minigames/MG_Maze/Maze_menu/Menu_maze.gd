extends Control

@onready var sounds_b = $button_sounds
var unlockable_num = "UnlockableLevel"
@onready var unlockable_level_1 = $MarginContainer_unlock/grid_con_unlock/UnlockableLevel
 
var anim_num = "AnimatedSprite2d"
var Color_rect = "ColorRect"

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.chapter_game == 2 && global.check_unlockmaze_chapter2 == true:
		get_node("MarginContainer_unlock").queue_free()
	elif global.chapter_game == 3 && global.check_unlockmaze_chapter3 == true:
		get_node("MarginContainer_unlock").queue_free()
		get_node("MarginContainer_unlock2").queue_free()
	#check pertama kali masuk scene menu_maze 
	elif global.chapter_game == 2 && global.check_unlockmaze_chapter2 == false :
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "1" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "2" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "3" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "4" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "5" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "6" +"/"+ anim_num).play("opening")
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "7" +"/"+ anim_num).play("opening")
		await $MarginContainer_unlock/grid_con_unlock/UnlockableLevel7/AnimatedSprite2d.animation_finished
		get_node("MarginContainer_unlock").queue_free()
		#global.check_unlock_level += 1
		global.check_unlockmaze_chapter2 = true
		
	elif global.chapter_game == 3 && global.check_unlockmaze_chapter3 == false:
		#animasi grid pertama
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "1" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "2" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "3" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "4" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "5" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "6" +"/"+ anim_num).play("opening")
		get_node("MarginContainer_unlock/grid_con_unlock/" + unlockable_num + "7" +"/"+ anim_num).play("opening")
		
		#animasi grid kedua
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "1" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "2" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "3" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "4" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "5" +"/"+ anim_num).play("opening")	
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "6" +"/"+ anim_num).play("opening")
		get_node("MarginContainer_unlock2/grid_con_unlock/" + unlockable_num + "7" +"/"+ anim_num).play("opening")
		await $MarginContainer_unlock2/grid_con_unlock/UnlockableLevel7/AnimatedSprite2d.animation_finished
		get_node("MarginContainer_unlock").queue_free()
		get_node("MarginContainer_unlock2").queue_free()
		global.check_unlockmaze_chapter3 = true
		
		#global.check_unlock_level += 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://world.tscn")


func _on_button_maze_1_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze1.tscn")


func _on_button_maze_2_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze2.tscn")


func _on_button_maze_3_pressed():
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze3.tscn")


func _on_button_maze_4_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze4.tscn")


func _on_button_maze_5_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze5.tscn")


func _on_button_maze_6_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze6.tscn")


func _on_button_maze_7_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze7.tscn")


func _on_button_maze_8_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze8.tscn")


func _on_button_maze_9_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze9.tscn")


func _on_button_maze_10_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze10.tscn")


func _on_button_maze_11_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze11.tscn")


func _on_button_maze_12_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze12.tscn")


func _on_button_maze_13_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze13.tscn")


func _on_button_maze_14_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze14.tscn")


func _on_button_maze_15_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze15.tscn")


func _on_button_maze_16_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze16.tscn")


func _on_button_maze_17_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze17.tscn")


func _on_button_maze_18_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze18.tscn")


func _on_button_maze_19_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze19.tscn")


func _on_button_maze_20_pressed():
	
	sounds_b.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Minigames/MG_Maze/mg_maze20.tscn")
