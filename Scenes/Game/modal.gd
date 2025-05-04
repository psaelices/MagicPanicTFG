extends PanelContainer
class_name Modal

@onready var leaderboard: Leaderboard = $MarginContainer/PanelContainer/VBoxContainer/Leaderboard

func _ready():
	GameGlobal.game_over.connect(open)

func open():
	show()
	leaderboard.scores.append({'name': 'jugador', 'score': GameGlobal.points})
	leaderboard.refrescar()


func _on_reset_btn_pressed() -> void:
	SceneManager.restart_current_scene()
	GameGlobal.reset_values()
