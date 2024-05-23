extends CharacterBody2D

func put_out():
	$Icon.play("put_out")
	await $Icon.animation_finished
