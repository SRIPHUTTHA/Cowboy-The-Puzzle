extends "res://scenes/player/EntityBase.gd"

export(PackedScene) var SHOOT: PackedScene = preload("res://scenes/projectiles/PlayerDagger.tscn")

onready var attackTimer = $AttackTimer

const died_ef = preload("res://assets/fx/died/died_fx.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("attack") and attackTimer.is_stopped():
		var _shoot = self.global_position.direction_to(get_global_position())
		shoot(_shoot)

func shoot(_shoot: Vector2)-> void:
	if SHOOT:
		var shoot = SHOOT.instance()
		get_tree().current_scene.add_child(shoot)
		shoot.global_position = self.global_position
		
		shoot.position = $BulletPoint.get_global_position()

		attackTimer.start()
		

func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = global_position):
	if EFFECT:
		var effect = EFFECT.instance()
		get_tree().current_scene.add_child(effect)
		effect.global_position = effect_position
		return effect

func died():
	spawn_effect(died_ef)
	queue_free()
	




func _on_player1_died():
	died()
