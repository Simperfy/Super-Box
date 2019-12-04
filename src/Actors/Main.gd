extends Node2D

class_name Main

func _on_Main_Menu_start_game() -> void:
	get_node("LevelTemplate/Player/Player Camera").current = true
	get_node("Main Menu/Main Menu Camera").current = false
	get_node("Main Menu").hide()
	get_node("LevelTemplate").show_all_children()
	get_node("LevelTemplate/Player").player_alive = true
	get_node("LevelTemplate/Game state msg Layer/You Died").hide()
	get_node("LevelTemplate/Game state msg Layer/Level Cleared").hide()

