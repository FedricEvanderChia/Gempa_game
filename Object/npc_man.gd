extends NPC
class_name NPC_man



func _on_object_valdi(bool):
	print("something")
	var tween = get_tree().create_tween()
	tween.tween_property(self,"modulate:a", 0, 0.3)
	tween.tween_callback(queue_free)
