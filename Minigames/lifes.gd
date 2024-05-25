extends Node
var local = 3


func _process(delta):
	if global.life == 0:
		global.difficulty = 1
		global.level = 1
	if global.life < local:
		var life = "life"+String.num(local)
		local-=1
		get_node(life+"/AnimatedSprite2D").play("Break")
		await get_node(life+"/AnimatedSprite2D").animation_finished
		get_node(life).queue_free()
