extends "res://scripts/overlap/Hitbox.gd"

export(int) var SPEED: int = 200

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += SPEED * direction * delta

func destroy():
	queue_free()

func _on_PlayerDagger_area_entered(area):
	destroy()

func _on_PlayerDagger_body_entered(body):
	destroy()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
