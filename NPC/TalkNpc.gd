extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		$Talk.show()
func _on_body_exited(body):
	if body.name == "player":
		$Talk.hide()
func _on_talk_pressed():
	if global.Dialogue == 3:
		print("Search_"+self.name)
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Search_"+self.name)
		if self.name == "Boy":
			global.Dialogue = 4
	else:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/Quest.dialogue"), self.name)
