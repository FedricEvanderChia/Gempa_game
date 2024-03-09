extends StaticBody2D
class_name NPC

var needs = "Beras"
var Goal = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position", position - Vector2(-150,-25),0.2)
	tween.tween_property(self,"position", position - Vector2(-300,0),0.2)
	tween.tween_property(self,"position", position - Vector2(-450,25),0.2)
	tween.tween_property(self,"position", position - Vector2(-600,0),0.2)
	tween.tween_property(self,"modulate:a", 0, 0.3)
	tween.tween_callback(queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if condition fulfilled
	#var tween = get_tree().create_tween()
	#var tween1 = get_tree().create_tween()
	#tween.tween_property(self,"position", position - Vector2(0,25),0.3)
	#tween1.tween_property(self,"modulate:a", 0, 0.3)
	#tween.tween_callback(queue_free)

func _benar():
	Goal = true
	
func _salah():
	Goal = false
