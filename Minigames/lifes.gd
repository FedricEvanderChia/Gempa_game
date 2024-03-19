extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.life <= 2:
		get_node("life3/AnimationPlayer").play("break")
		await get_node("life3/AnimationPlayer").animation_finished
		get_node("life3").hide()
	if global.life <= 1:
		get_node("life2/AnimationPlayer").play("break")
		await get_node("life2/AnimationPlayer").animation_finished
		get_node("life2").hide()
	if global.life == 0:
		get_node("life1/AnimationPlayer").play("break")
		await get_node("life1/AnimationPlayer").animation_finished
		get_node("life1").hide()
	for n in range(1,global.life+1):
		var m = "life"+str(n)
		get_node(m).show()
	
		
