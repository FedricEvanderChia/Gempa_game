extends AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if frame == 0:
		$"../list".show()
	else:
		$"../list".hide()
