extends Node

const SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"Dialogue" = global.Dialogue,
		"goal" = global.goal,
		"needs" = global.needs,
		"life" = global.life,
		"minigame_score" = global.minigame_score
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var curr_line = JSON.parse_string(file.get_line())
			if curr_line:
				global.Dialogue = curr_line["Dialogue"]
				global.goal = curr_line["goal"]
				global.needs = curr_line["needs"]
				global.life = curr_line["life"]
				global.minigame_score = curr_line["minigame_score"]
		

func loading():
	pass
