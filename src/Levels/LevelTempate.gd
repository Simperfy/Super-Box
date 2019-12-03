extends Node2D

func _input(event):
	if(event.is_action_pressed("restart")):
		get_tree().reload_current_scene()
	
	if(event.is_action_pressed("fire")):
		fire_bullet()

func fire_bullet() -> void:
	var bullet_text : Label = get_node("Player/Camera2D/Bullet Count Text")
	if (bullet_text.text.to_int() > 0):
		var scene = load("res://src/Actors/Bullet.tscn")
		var scene_instance : KinematicBody2D = scene.instance()
		scene_instance.position = Vector2(get_node("Player/Muzzle").global_position.x, get_node("Player/Muzzle"). global_position.y)
		add_child(scene_instance)
		bullet_text.text = String(bullet_text.text.to_int() - 1)