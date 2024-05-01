extends CharacterBody2D
class_name NPC
var rng = RandomNumberGenerator.new()
var needs = global.needs
@export var emmiter:Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	generateTexture()
	var tween = create_tween()
	tween.tween_property(self,"position", position - Vector2(-150,-25),0.2)
	tween.tween_property(self,"position", position - Vector2(-300,0),0.2)
	tween.tween_property(self,"position", position - Vector2(-450,25),0.2)
	tween.tween_property(self,"position", position - Vector2(-600,0),0.2)
	await tween.finished
	while !global.goal:
		await get_tree().create_timer(0.1).timeout
	var tween1 = create_tween()
	var tween2 = create_tween()
	tween1.tween_property(self,"position", position - Vector2(-150,25),0.2)
	tween1.tween_property(self,"position", position - Vector2(-300,0),0.2)
	tween2.tween_property(self,"modulate:a", 0, 0.4)
	tween1.tween_callback(queue_free)
	global.goal = false
	needs.clear()
	#pass
func _process(delta):
	generateOrder()
	if needs.size()<3:
		get_node("OrderBubble/Panel/item_display3").frame = 0
		if needs.size()<2:
			get_node("OrderBubble/Panel/item_display2").frame = 0
	
func generateOrder():	
	for idx in range(0,needs.size()):
		var item_display = "OrderBubble/Panel/item_display" + String.num(idx+1)
		if needs[idx] == "Air":
			get_node(item_display).frame = 1
		elif needs[idx] == "Beras":
			get_node(item_display).frame = 2
		elif needs[idx] == "Tenda":
			get_node(item_display).frame = 3
	
func generateTexture():
	var num = rng.randi_range(0, 3)
	get_node("NpcTexture").frame = num
