extends Camera2D
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func shake():
	var curr = self.offset
	var tween2 = create_tween()
	tween2.tween_property(self,"offset",curr - Vector2(rng.randi_range(-10,10),rng.randi_range(-10,10)),0.05)
	tween2.tween_property(self,"offset",curr - Vector2(rng.randi_range(-8,8),rng.randi_range(-8,8)),0.05)
	tween2.tween_property(self,"offset",curr - Vector2(rng.randi_range(-6,6),rng.randi_range(-6,6)),0.05)
	tween2.tween_property(self,"offset",curr - Vector2(rng.randi_range(-4,4),rng.randi_range(-4,4)),0.05)
	tween2.tween_property(self,"offset",curr - Vector2(rng.randi_range(-2,2),rng.randi_range(-2,2)),0.05)
	tween2.tween_property(self,"offset",curr,0.05)
