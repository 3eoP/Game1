extends Node2D




func _on_exit_pressed() -> void:
	get_tree().exit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Player/level.tscn")
