extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	var num = rng.randi_range(0,5)
	if num == 0:
		$ColorRect.modulate = Color(Color.CORAL)
	if num ==1:
		$ColorRect.modulate = Color(Color.DARK_RED)
	if num ==2:
		$ColorRect.modulate = Color(Color.DARK_MAGENTA)
	if num ==3:
		$ColorRect.modulate = Color(Color.DARK_GREEN)
	if num ==4:
		$ColorRect.modulate = Color(Color.DARK_BLUE)
	else:
		$ColorRect.modulate = Color(Color.DARK_KHAKI)
	await get_tree().create_timer(1).timeout
	global.nextMG()
