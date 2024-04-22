extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.talker == "Mob":
		self.show()
		self.modulate = Color(1, 1, 1)
	elif global.talker == "end":
		self.hide()
	else:
		self.modulate = Color(0.5, 0.5, 0.5)
