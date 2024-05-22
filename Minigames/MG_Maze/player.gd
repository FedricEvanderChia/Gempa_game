extends Node2D

@export var goal: int
@export var size: int
@onready var tile_map = $"../TileMap1"
var is_moving = false
var dir = "down"
var invincible = false
var is_hurt = false
var axe = 0
var cam

func _ready():
	if $"../Camera2D" == null:
		cam = $Icon/Camera2D
	else:
		$Icon/Camera2D.queue_free()
		cam = $"../Camera2D"
func _physics_process(delta):
	if !is_moving:
		$Icon.animation = dir
		$Icon.frame = 1
		return
	else:
		$Icon.play(dir)
	if global_position == $Icon.global_position:
		is_moving = false
		return
	$Icon.global_position = $Icon.global_position.move_toward(global_position, 1+global.difficulty)
func _process(delta):
	if is_hurt:
		hurt()
	if is_moving:
		return
	if Input.is_action_pressed("ui_right"):
		dir = "right"
		move(Vector2.RIGHT)
	elif Input.is_action_pressed("ui_left"):
		dir = "left"
		move(Vector2.LEFT)
	elif Input.is_action_pressed("ui_up"):
		dir = "up"
		move(Vector2.UP)
	elif Input.is_action_pressed("ui_down"):
		dir = "down"
		move(Vector2.DOWN)
	
func move(direction: Vector2):
	var currTile: Vector2i = tile_map.local_to_map(global_position)
	var nextTile: Vector2i = Vector2i(
		currTile.x + direction.x,
		currTile.y + direction.y
	)
	var nextTile2: Vector2i = Vector2i(
		nextTile.x + direction.x,
		nextTile.y + direction.y
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0,nextTile)
	var curr_data: TileData = tile_map.get_cell_tile_data(0,currTile)
	if tile_data:
		var tileName = tile_data.get_custom_data("TileName")
		var currName = curr_data.get_custom_data("TileName")
		if "rescue" in tileName:
			tile_map.set_cell(0,nextTile,0,Vector2i(0,0))
			goal -=1
		elif "axe" in tileName:
			tile_map.set_cell(0,nextTile,0,Vector2i(0,0))
			axe +=1
		elif "exit" in tileName and goal == 0:
			get_tree().change_scene_to_file("res://world.tscn")
		elif "wood" in tileName:
			if axe >= 1:
				tile_map.set_cell(0,nextTile,0,Vector2i(0,0))
				axe -=1
				cam.shake()
				return
			else:
				return
		elif "box_in" in tileName:
			if tile_map.get_cell_tile_data(0,nextTile2).get_custom_data("TileName") != "path":
				return
			else:
				if dir == "right":
					pushing(nextTile,nextTile2,0)
				elif dir == "left":
					pushing(nextTile,nextTile2,TileSetAtlasSource.TRANSFORM_FLIP_H)
				elif dir == "up":
					pushing(nextTile,nextTile2,TileSetAtlasSource.TRANSFORM_FLIP_V + TileSetAtlasSource.TRANSFORM_TRANSPOSE)
				elif dir == "down":
					pushing(nextTile,nextTile2,TileSetAtlasSource.TRANSFORM_FLIP_H + TileSetAtlasSource.TRANSFORM_TRANSPOSE)
		elif "break" in curr_data.get_custom_data("TileName"):
			breaking(currTile)
				
				
	if tile_data.get_custom_data("walkable") == false:
		return
	
	is_moving = true
	global_position = tile_map.map_to_local(nextTile)
	$Icon.global_position = tile_map.map_to_local(currTile)

func breaking(currTile: Vector2i):
	tile_map.set_cell(0,currTile,0,Vector2i(1,1))
	await get_tree().create_timer(0.1).timeout
	tile_map.set_cell(0,currTile,0,Vector2i(2,1))
	await get_tree().create_timer(0.1).timeout
	tile_map.set_cell(0,currTile,0,Vector2i(3,1))

func pushing(nextTile: Vector2i,nextTile2: Vector2i,rotate:int):
	tile_map.set_cell(0,nextTile,0,Vector2i(0,2),rotate)
	tile_map.set_cell(0,nextTile2,0,Vector2i(1,2),rotate)
	await get_tree().create_timer(0.1).timeout
	tile_map.set_cell(0,nextTile,0,Vector2i(2,2),rotate)
	tile_map.set_cell(0,nextTile2,0,Vector2i(3,2),rotate)
	await get_tree().create_timer(0.1).timeout
	tile_map.set_cell(0,nextTile,0,Vector2i(0,0))
	tile_map.set_cell(0,nextTile2,0,Vector2i(4,2))
	
func _on_body_entered(body):
	if "fire" in body.name:
		is_hurt = true

func _on_body_exited(body):
	if "fire" in body.name:
		is_hurt = false

func hurt():
	if !invincible:
		print("ouch")
		global.minigame_score -= 50 
		global.life -= 1
		var tween = create_tween()
		tween.tween_property($"..","modulate",Color.CRIMSON,0.3)
		tween.tween_property($"..","modulate",Color(1, 1, 1),0.3)
		cam.shake()
		invincibility()

func invincibility():
	invincible = true
	var tween = create_tween()
	for i in range(0,9): 
		tween.tween_property($Icon,"modulate",Color(1, 1, 1, 0),0.1)
		tween.tween_property($Icon,"modulate",Color(1, 1, 1, 1),0.1)
	await get_tree().create_timer(2).timeout
	invincible = false


