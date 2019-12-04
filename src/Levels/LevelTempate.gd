extends Node2D

class_name LevelTemplate

func _ready() -> void:
	hide_all_children()

func _on_Player_player_died() -> void:
	get_node("Player").hide()
	get_node("Player").set_physics_process(false)
	get_node("Game state msg Layer/You Died").show()
	
# When Player clears the level
# Display the You win message
func _on_Portal_level_cleared():
	get_node("Game state msg Layer/Level Cleared").show()
	get_node("Player").god_mode = true
	
func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("restart")):
		restart_level()
	
	if(event.is_action_pressed("fire")):
		fire_bullet()

func fire_bullet() -> void:
	var bullet_text : Label = get_node_or_null("Player/Player Camera/Bullet Count Text")
	var is_player_gun_enabled : bool = get_node("Player").gun_enabled
	
	# Check if player is not dead
	if(bullet_text == null):
		print("[LevelTemplate.gd:22] bullet_text is null")
		return
	
	if(!is_player_gun_enabled):
		print("[LevelTemplate] Player cannot fire without weapon")
		return
		
	if (bullet_text.text.to_int() > 0):
		var scene = load("res://src/Actors/Bullet.tscn")
		var scene_instance : KinematicBody2D = scene.instance()
		scene_instance.position = Vector2(get_node("Player/Muzzle").global_position.x, get_node("Player/Muzzle"). global_position.y)
		add_child(scene_instance)
		bullet_text.text = String(bullet_text.text.to_int() - 1)
		
# restart level
func restart_level() -> void:
	get_tree().reload_current_scene()

func hide_all_children() -> void:
	for i in range(len(get_children())):
		if (i < 2):
			continue
		get_child(i).hide()
	
	get_node("CanvasLayer/background").hide()
	get_node("Game state msg Layer/You Died").hide()
	get_node("Game state msg Layer/Level Cleared").hide()

func show_all_children() -> void:
	for i in range(len(get_children())):
		if (i < 2):
			continue
		get_child(i).show()
	
	get_node("CanvasLayer/background").show()
	get_node("Game state msg Layer/You Died").show()
	get_node("Game state msg Layer/Level Cleared").show()
