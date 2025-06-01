extends PanelContainer
class_name Modal

@onready var leaderboard: Leaderboard = $MarginContainer/PanelContainer/VBoxContainer/Leaderboard

func _ready():
	GameGlobal.game_over.connect(open)

func open():
	show()
	GameGlobal.last_game_played = {'name': 'Player', 'score': GameGlobal.points}
	GameGlobal.scores.append(GameGlobal.last_game_played)
	leaderboard.refrescar()


func _on_reset_btn_pressed() -> void:
	SceneManager.restart_current_scene()
	GameGlobal.reset_values()
