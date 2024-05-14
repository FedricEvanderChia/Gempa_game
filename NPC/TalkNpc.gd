extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body.name)
	if body.name == "player":
		$Talk.show()
func _on_body_exited(body):
	if body.name == "player":
		$Talk.hide()
func _on_talk_pressed():
	if global.minigame_score >= 1500 && global.Dialogue == 3:
		if self.name =="Man": 
			DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Search1")
		elif  self.name == "Woman":
			DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Search2")
		elif  self.name == "girl":
			DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "Search3")
		elif  self.name == "boy":
			DialogueManager.show_dialogue_balloon(load("res://dialogue/Act1.dialogue"), "FoundInfo")
			global.Dialogue = 4
