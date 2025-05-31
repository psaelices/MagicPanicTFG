extends Control


func _ready():
	MusicPlayer.play_music()

func _on_exit_game_btn_pressed() -> void:
	get_tree().quit()
