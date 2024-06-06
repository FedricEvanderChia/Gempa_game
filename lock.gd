extends Node2D

func _process(delta):
	if global.Dialogue == 5 and global.unlockmaze:
		unlock()
func unlock():
	self.show()
	$AnimatedSprite2D.play("unlock")
	await get_tree().create_timer(2).timeout
	self.hide()
