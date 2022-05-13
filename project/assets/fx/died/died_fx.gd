extends AnimatedSprite


func _on_die_fx_animation_finished():
	queue_free()
