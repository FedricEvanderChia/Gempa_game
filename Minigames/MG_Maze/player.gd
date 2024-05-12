extends Node2D

var goal = 4
@onready var tile_map = $"../TileMap"
var is_moving = false

func _physics_process(delta):
	if !is_moving:
		return
	if global_position == $Icon.global_position:
		is_moving = false
		return
	$Icon.global_position = $Icon.global_position.move_toward(global_position, 1+global.difficulty)
func _process(delta):
	if is_moving:
		return
	if Input.is_action_pressed("ui_right"):
		move(Vector2.RIGHT)
	elif Input.is_action_pressed("ui_left"):
		move(Vector2.LEFT)
	elif Input.is_action_pressed("ui_up"):
		move(Vector2.UP)
	elif Input.is_action_pressed("ui_down"):
		move(Vector2.DOWN)
	
func move(direction: Vector2):
	var currTile: Vector2i = tile_map.local_to_map(global_position)
	var nextTile: Vector2i = Vector2i(
		currTile.x + direction.x,
		currTile.y + direction.y
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0,nextTile)
	var tileName = tile_data.get_custom_data("TileName")
	if tile_data:
		if "rescue" in tileName:
			tile_map.set_cell(0,nextTile,0,Vector2i(0,0))
			goal -=1
		if "exit" in tileName and goal == 0:
			get_tree().change_scene_to_file("res://world.tscn")
	if tile_data.get_custom_data("walkable") == false:
		return
	
	
	is_moving = true
	global_position = tile_map.map_to_local(nextTile)
	$Icon.global_position = tile_map.map_to_local(currTile)
