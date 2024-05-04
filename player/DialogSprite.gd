extends Node2D
class_name DialogSprite

@export var randStr: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_str: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func apply_shake():
	shake_str = randStr

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.talker == name:
		self.show()
		self.modulate = Color(1, 1, 1)
		self.top_level = true
	elif global.talker == name+"_Shake":
		self.show()
		self.modulate = Color(1, 1, 1)
		self.top_level = true
		if global.talker == name+"_Shake":
			apply_shake()
		if shake_str > 0:
			shake_str = lerpf(shake_str,0,shakeFade * delta)
			self.position += randOffset()
	elif global.talker == "-"+name:
		self.hide()
	elif global.talker == "end":
		self.hide()
	else:
		self.modulate = Color(0.5, 0.5, 0.5)
		self.top_level = false

func randOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_str,shake_str), rng.randf_range(-shake_str,shake_str))
