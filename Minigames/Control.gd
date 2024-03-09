extends Control


@onready var scoretext = $scoretext
func _ready():
	pass # Replace with function body.



func _process(delta):
	scoretext.text = "Score: %d" % global.minigame_score
	pass
