extends Node2D

func _input(event):
	if(event.is_action_pressed("restart")):
		get_tree().reload_current_scene()
		
	if(event.is_action_pressed("fire")):
		fire_bullet()

func fire_bullet() -> void:
	var scene = load("res://src/Actors/Bullet.tscn")
	var scene_instance : KinematicBody2D = scene.instance()
	scene_instance.set_name("scene")
	scene_instance.global_position.y = get_node("Player").global_position.y + 20
	scene_instance.global_position.x = get_node("Player").global_position.x + 120
	add_child(scene_instance)