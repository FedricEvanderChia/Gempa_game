extends CharacterBody2D
class_name NPC
signal resumed
signal stopped

var needs = "Beras"
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.tween_property(self,"position", position - Vector2(-150,-25),0.2)
	tween.tween_property(self,"position", position - Vector2(-300,0),0.2)
	tween.tween_property(self,"position", position - Vector2(-450,25),0.2)
	tween.tween_property(self,"position", position - Vector2(-600,0),0.2)
	while !global.goal:
		await get_tree().create_timer(0.1).timeout
	self.queue_free()
	global.goal = false
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#print("this indeed happend")
	#var tween = get_tree().create_tween()
	#var tween1 = get_tree().create_tween()
	#tween.tween_property(self,"position", position - Vector2(0,25),0.3)
	#tween.tween_property(self,"modulate:a", 0, 0.3)
	#tween.tween_callback(queue_free)
	

func resume():
	resumed.emit()
	print("capek")
	#var tween = get_tree().create_tween()
	#tween.tween_property(self,"modulate:a", 0, 0.3)
	#tween.tween_callback(queue_free)
	
func salah():
	pass
