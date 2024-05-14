extends Node2D
class_name DialogSprite

@export var randStr: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shake_str: float = 0.0
var FrontRizki = Vector2(375,375)
var BackRizki = Vector2(100,375)
var TalkerPos = Vector2(975,375)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.talker == name:
		self.show()
		self.modulate = Color(1, 1, 1)
		self.top_level = true
	elif global.talker == name+"_left":
		self.show()
		self.modulate = Color(1, 1, 1)
		self.top_level = true
		await create_tween().tween_property(self,"position",FrontRizki,0.5)
		$Sprite2D.flip_h = false
	elif global.talker == name+"_anim":
		self.show()
		self.modulate = Color(1, 1, 1)
		self.top_level = true
		$Sprite2D.play("default")
	elif global.talker == name+"_hide":
		self.show()
		self.modulate = Color(1, 1, 1)
		self.top_level = true
		await create_tween().tween_property(self,"position",BackRizki,0.5)
		$Sprite2D.flip_h = false
	elif global.talker == "-"+name:
		self.hide()
	elif global.talker == "end":
		self.hide()
	else:
		self.modulate = Color(0.5, 0.5, 0.5)
		self.top_level = false
