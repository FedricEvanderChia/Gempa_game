extends ParallaxBackground

var speed = 750
# Called when the node enters the scene tree for the first time.
func _process(delta):
	scroll_offset.x -= speed * delta
