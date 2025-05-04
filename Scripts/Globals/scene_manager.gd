extends Node

func change_scene_to(scene_path: String):
	get_tree().change_scene_to_file(scene_path)

func restart_current_scene():
	get_tree().reload_current_scene()
