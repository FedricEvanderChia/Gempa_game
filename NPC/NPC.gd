extends CharacterBody2D
class_name NPC

var rng = RandomNumberGenerator.new()
var needs = global.needs
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.tween_property(self,"position", position - Vector2(-150,-25),0.2)
	tween.tween_property(self,"position", position - Vector2(-300,0),0.2)
	tween.tween_property(self,"position", position - Vector2(-450,25),0.2)
	tween.tween_property(self,"position", position - Vector2(-600,0),0.2)
	await tween.finished
	while !global.goal:
		await get_tree().create_timer(0.1).timeout
	self.queue_free()
	global.goal = false
	needs.clear()
	#pass

func _process(delta):
	if !global.needs.has("Beras"):
		get_node("OrderBeras").hide()
	if !global.needs.has("Air"):
		get_node("OrderAir").hide()
	if !global.needs.has("Tenda"):
		get_node("OrderTenda").hide()
