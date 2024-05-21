extends StaticBody2D

@export var item: inventory_item
var player = null

func _ready():
	get_node("itembutton").hide()
	$Sprite2D.texture = item.texture

func _on_interact_area_2d_body_entered(body):
	if body.name == "player":
		player = body
		playercollect()
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
	get_node("itembutton").show()

func _on_interact_area_2d_body_exited(body):
	get_node("itembutton").hide()

func playercollect():
	player.collectitem(item)


	
