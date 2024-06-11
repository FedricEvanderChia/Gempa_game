extends Control

@onready var sounds_b = $button_sounds
var unlockable_num = "UnlockableLevel"
@onready var unlockable_level_1 = $MarginContainer_unlock/grid_con_unlock/UnlockableLevel
 
var anim_num = "AnimatedSprite2d"
var Color_rect = "ColorRect"

var checklist_pos
var checklist_preload = preload("res://Minigames/MG_Maze/Maze_menu/checklist.tscn")

var coordinates_checklist_x = [360,485,610,735, 360,485,610,735,  360,485,610,735, 357,483,608,732, 357,483,608,732]
var coordinates_checklist_y = [120,120,120,120, 220,220,220,220,  320,320,320,320, 425,425,425,425, 524,524,524,524]

	
#$"../..".dropItem("res://Inventory/items/Dokumen.tres",$".".global_position )

# Called when the node enters the scene tree for the first time.
func _ready():
	#mengecek kondisi true/false disetiap node array dari maze 1 sampai maze 20 jika true maka membuat node checklist
	#checklist_create(coordinates_checklist_x[4],coordinates_checklist_y[4])
	for n in range(0,20):
		if global.check_maze_level_condition[n] == true:
			checklist_create(coordinates_checklist_x[n],coordinates_checklist_y[n])
		
	
		
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
	
func checklist_create(pos_x, pos_y):
	var new_checklist = checklist_preload.instantiate()
	$checklist_container.add_child(new_checklist)
	checklist_pos = new_checklist
	checklist_pos.global_position = Vector2(pos_x,pos_y)
	checklist_pos.scale = Vector2(0.9,0.75)
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
