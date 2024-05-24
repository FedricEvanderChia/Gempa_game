extends CharacterBody2D

func put_out():
	$CollisionShape2D.queue_free()
	$Icon.play("put_out")
	await $Icon.animation_finished
