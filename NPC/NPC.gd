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
	generateGoal()
	while !global.goal:
		await get_tree().create_timer(0.1).timeout
	self.queue_free()
	global.goal = false
	needs.clear()
	get_node("OrderBeras").hide()
	get_node("OrderAir").hide()
	get_node("OrderTenda").hide()
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func generateGoal():
	var num = rng.randi_range(1, 3)
	for number in range(0,1):
		var obj = rng.randi_range(0, 2)
		if obj == 0:
			needs.insert (number,"Beras")
			get_node("OrderBeras").show()
		elif obj == 1:
			needs.insert (number,"Air")
			get_node("OrderAir").show()
		elif obj == 2:
			needs.insert (number,"Tenda")
			get_node("OrderTenda").show()
	for number in range(0,needs.size()):
		print(needs[number])
