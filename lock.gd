extends Node2D
var locked = true

func _process(delta):
	if global.Dialogue == 5 and locked:
		unlock()
		locked = !locked
func unlock():
	self.show()
	$AnimatedSprite2D.play("unlock")
	await get_tree().create_timer(2).timeout
	self.hide()
