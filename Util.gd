extends Node
const SAVE_PATH = "res://savegame.bin"
const SAVE_INV = "res://saveinv.bin"


func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(global.Dialogue)
	file.store_var(global.goal)
	file.store_var(global.life)
	file.store_var(global.minigame_score)
	file.store_var(global.inv)

func Unused_save_GAME():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"Dialogue" = global.Dialogue,
		"life" = global.life,
		"minigame_score" = global.minigame_score,
		"inv" = global.inv
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	if FileAccess.file_exists(SAVE_PATH):
		print("file found")
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		global.Dialogue = file.get_var()
		global.life = file.get_var()
		global.minigame_score = file.get_var()
		global.inv = file.get_var()
	else:
		print("file not found")
		
		
func loadGame2():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var curr_line = JSON.parse_string(file.get_line())
			if curr_line:
				global.Dialogue = curr_line["Dialogue"]
				global.goal = curr_line["goal"]
				global.life = curr_line["life"]
				global.minigame_score = curr_line["minigame_score"]
				global.inv = curr_line["inv"]
func loading():
	pass
