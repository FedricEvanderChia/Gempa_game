extends Control

var chapter_number = global.chapter_game
@onready var chapterlabel = $chapterlabel

func _ready():
	modulatelabel()
	
func modulatelabel():
	chapterlabel.text = "Chapter: %d" % chapter_number

	create_tween().tween_property($ColorRect,"modulate",Color(1,1,1,1), 2)
	create_tween().tween_property($chapterlabel,"modulate",Color(1,1,1,1), 2)
	await get_tree().create_timer(4).timeout
	create_tween().tween_property($ColorRect,"modulate",Color(1,1,1,0), 2)
	create_tween().tween_property($chapterlabel,"modulate",Color(1,1,1,0), 2)
	await get_tree().create_timer(3).timeout
	$chapterlabel.queue_free()
	$ColorRect.queue_free()
	
	
