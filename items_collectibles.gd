extends StaticBody2D
class_name items_collectibles

@export var item: inventory_item
var player = null
signal Obtain(item)

func _ready():
	$Sprite2D.texture = item.texture

func _on_interact_area_2d_body_entered(body):
	if body.name == "player":
		player = body
		playercollect()
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
		
func playercollect():
	player.collectitem(item)
	Obtain.emit(item)
	

	
