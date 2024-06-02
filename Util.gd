extends Node

const SAVE_PATH = "res://savegame.bin"
var inventoryre_sour_save = "Inventorysave.tres"
var save_file_path = "res://Inventory/"
@onready var inv: inventory_game = preload("res://Inventory/Inventorysave.tres")
var inventory: inventory_game = global.invt
var inventory1 =  inventory_game.new()

func _ready():
	#verify_inven_save(save_file_path)
	pass
func verify_inven_save(path: String):
	DirAccess.make_dir_absolute(path)
	
func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"Dialogue" = global.Dialogue,
		"life" = global.life,
		"minigame_score" = global.minigame_score
	}
	
	ResourceSaver.save(inventory, save_file_path + inventoryre_sour_save)
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var curr_line = JSON.parse_string(file.get_line())
			if curr_line:
				global.Dialogue = curr_line["Dialogue"]
				global.life = curr_line["life"]
				global.minigame_score = curr_line["minigame_score"]
				inventory = ResourceLoader.load(save_file_path+ inventoryre_sour_save).duplicate(true)
				

			
func loading():
	pass
