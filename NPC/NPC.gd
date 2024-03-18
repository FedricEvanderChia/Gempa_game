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
	if !global.needs.is_empty():
		var order = "Order"+global.needs[0]
		get_node(order).show()
		if  global.needs[0] == "Air":
			get_node("OrderBeras").hide()
			get_node("OrderTenda").hide()
			
		elif global.needs[0] == "Beras":
			get_node("OrderAir").hide()
			get_node("OrderTenda").hide()
		
		elif global.needs[0] == "Tenda":
			get_node("OrderAir").hide()
			get_node("OrderBeras").hide()
			
