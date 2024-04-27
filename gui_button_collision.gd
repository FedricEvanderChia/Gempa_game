extends Area2D


func _ready():
	modulate.a8 = 255
	pass
	


func _on_body_entered(body): 
	if body.name == "player":
		#opacity biar bisa mengedit tingkat transaparansi sprite
		modulate.a8 = 100
		print("modulate works")
	
	
func _on_body_exited(body):
	if body.name == "player":
		modulate.a8 = 255
	
