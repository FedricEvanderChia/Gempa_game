extends Label
var currPos
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	currPos = $PlusRep.position
	var points = float(global.minigame_score)/50.00
	if points > 0.00 : add_score(points)
	global.addRep.connect(add_score)
	global.minigame_score = 0
	
func _process(delta):
	$".".text = ": %.1f" % global.Reputasi

func add_score(val):
	if val > 0:
		$PlusRep.text = "+%.1f" % val
		create_tween().tween_property($PlusRep,"theme_override_colors/font_color",Color(0, 1, 0),0) 
	else:
		$PlusRep.text = "%.1f" % val
		create_tween().tween_property($PlusRep,"theme_override_colors/font_color",Color(1, 0, 0),0) 
	$PlusRep.show()
	$PlusRep.position = currPos
	$PlusRep.modulate = Color(1, 1, 1, 1)
	global.Reputasi += val
	var tween = create_tween()
	var tween2 = create_tween()
	tween2.tween_property($PlusRep,"modulate", Color(1, 1, 1, 1),2)
	tween2.tween_property($PlusRep,"modulate", Color(1, 1, 1, 0),2)
	tween.tween_property($PlusRep,"position",currPos,2)
	tween.tween_property($PlusRep,"position",currPos + Vector2(0,-50),2)
	tween.tween_property($PlusRep,"position",currPos,0)
