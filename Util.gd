extends Node

const SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"first" = global.first,
		"EntryDialogue" = global.EntryDialogue,
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
				global.first = curr_line["first"]
				global.EntryDialogue = curr_line["EntryDialogue"]
				global.goal = curr_line["goal"]
				global.needs = curr_line["needs"]
				global.life = curr_line["life"]
				global.minigame_score = curr_line["minigame_score"]
			 
		