extends Node2D

var draggable = false
var inside_drop_point = false
var body_ref
var offset: Vector2 
var initialPos: Vector2 

func _process(delta):
	pass
	#if draggable:
	#	if Input.is_action_just_pressed("click"):
	#		initialPos = global_position
	#		offset = get_global_mouse_position() - global_position
	#		global.is_dragging = true
	#	if Input.is_action_pressed("click"):
	#		global_position = get_global_mouse_position()
	#	elif Input.is_action_just_released("click"):
	#		global.is_dragging = false
	#		var tween = get_tree() .create_tween()
	#		if inside_drop_point:
	#			tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
	#		else:
	#			tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)
			
func _on_area_2d_mouse_entered():
	pass
	#if not global.is_dragging:
	#	draggable = true
	#	scale = Vector2 (1.05,1.05)


func _on_area_2d_mouse_exited():
	pass
	#if not global.is_dragging:
	#	draggable = false
	#	scale = Vector2 (1,1)

func _on_area_2d_body_entered(body):
	pass 
	#if body.is_in_group('dropable'):
	#	var inside_drop_point = true
	#	body_ref = body

func _on_area_2d_body_exited(body):
	pass 
	#if body.is_in_group('dropable'):
	#	var inside_drop_point = false
