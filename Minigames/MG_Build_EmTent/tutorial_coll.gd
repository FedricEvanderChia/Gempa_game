extends Node2D

func _on_area_2d_area_entered(area):
	print("now")
	$"OrderBubble".show()
	$"now".show()


func _on_area_2d_area_exited(area):
	print("naw")
	$"OrderBubble".hide()
	$"now".hide()
