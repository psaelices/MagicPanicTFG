extends CanvasLayer

func _ready() -> void:
	GameGlobal.point_scored.connect(update_score_lbl)
	

func update_score_lbl(points: int):
	$HBoxContainer/Points_Lbl.text = str(points)
