extends Node2D

func _ready():
	await get_tree().create_timer(1).timeout
	if global.Reputasi >= 50 and !global.unlockmaze:
		unlock()
		global.unlockmaze = true
func unlock():
	self.show()
	$AnimatedSprite2D.play("unlock")
	$AudioStreamPlayer.play()
	await get_tree().create_timer(3).timeout
	create_tween().tween_property($Label,"modulate",Color(1,1,1,0),1)
	$Label.text = "Sekarang kamu bisa mengakses\nMinigame Maze"
	create_tween().tween_property($Label,"modulate",Color(1,1,1,1),1)
	await get_tree().create_timer(3).timeout
	self.hide()
