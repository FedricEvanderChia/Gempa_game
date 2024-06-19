extends Node

const SAVE_PATH = "user://savegame.bin"
const save_file_path = "user://Inventorysave.tres"
var inventory: inventory_game = load("res://Inventory/Inventorysave.tres")


func _ready():
	pass
	
	#verify_inven_save(save_file_path)
	
func verify_inven_save(path: String):
	DirAccess.make_dir_absolute(path)
	
func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"Dialogue" = global.Dialogue,
		"life" = global.life,
		"Reputasi" = global.Reputasi,
		"Quest" = global.quest_status,
		"Progress" = global.quest_count,
		"Bridge" = global.Bridge,
		"Last_checkpoint_x" = global.Lastpos.x,
		"Last_checkpoint_y" = global.Lastpos.y,
		"Last_map" = global.lastmap,
		"Check_unlockmaze_chapter2" = global.check_unlockmaze_chapter2,
		"Check_unlockmaze_chapter3" = global.check_unlockmaze_chapter3,
		"Chapter_game" = global.chapter_game
	}
	ResourceSaver.save(inventory, save_file_path)
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	if FileAccess.file_exists(save_file_path) == true:
		print("file exist")
		#inventory = ResourceLoader.load(save_file_path).duplicate(true)
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var curr_line = JSON.parse_string(file.get_line())
			if curr_line:
				global.Dialogue = curr_line["Dialogue"]
				global.life = curr_line["life"]
				global.Reputasi = curr_line["Reputasi"]
				global.quest_status = curr_line["Quest"]
				global.quest_count = curr_line["Progress"]
				global.Bridge = curr_line["Bridge"]
				global.Lastpos.x = curr_line["Last_checkpoint_x"]
				global.Lastpos.y = curr_line["Last_checkpoint_y"]
				global.lastmap = curr_line["Last_map"]
				global.check_unlockmaze_chapter2 = curr_line["Check_unlockmaze_chapter2"]
				global.check_unlockmaze_chapter3 = curr_line["Check_unlockmaze_chapter3"]
				global.chapter_game = curr_line["Chapter_game"]
func emptyInv():
	inventory = ResourceLoader.load("res://Inventory/New_Save.tres").duplicate(true)
	ResourceSaver.save(inventory, save_file_path)
	
func ResetGame():
	emptyInv()
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"Dialogue" = 0,
		"life" = 3,
		"Reputasi" = 0.00,
		"Quest" = "",
		"Progress" = 0,
		"Bridge" = "Rusak",
		"Last_checkpoint_x" = 0,
		"Last_checkpoint_y" = 0,
		"Last_map" = 1,
		"Check_unlockmaze_chapter2" = false,
		"Check_unlockmaze_chapter3" = false,
		"Chapter_game" = 1
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
