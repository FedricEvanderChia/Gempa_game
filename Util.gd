extends Node

const SAVE_PATH = "res://savegame.bin"
const save_file_path = "res://Inventory/Inventorysave.tres"
var inventory: inventory_game

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
		"minigame_score" = global.minigame_score,
		"Quest" = global.quest_status,
		"Progress" = global.quest_count
	}
	
	ResourceSaver.save(inventory, save_file_path)
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	if FileAccess.file_exists(save_file_path) == true:
		print("file exist")
		inventory = ResourceLoader.load(save_file_path).duplicate(true)
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var curr_line = JSON.parse_string(file.get_line())
			if curr_line:
				global.Dialogue = curr_line["Dialogue"]
				global.life = curr_line["life"]
				global.minigame_score = curr_line["minigame_score"]
				global.quest_status = curr_line["Quest"]
				global.quest_count = curr_line["Progress"]
func emptyInv():
	inventory = ResourceLoader.load("res://Inventory/New_Save.tres").duplicate(true)
	ResourceSaver.save(inventory, save_file_path)
