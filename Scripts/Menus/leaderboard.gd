extends Control
class_name Leaderboard

@export var custom_font: Font
@export var font_size: int = 24

@onready var score_container: VBoxContainer = $PanelContainer/MarginContainer/Leaderboard/ScrollContainer/ScoreContainer

func _ready() -> void:
	refrescar()

##Reordena los puntajes de mayor a menor
func sort_scores()->void:
	GameGlobal.scores.sort_custom(func(a: Dictionary, b: Dictionary): return a.score >= b.score)

##Actualiza los puntajes mostrados
func refrescar()->void:
	for r in score_container.get_children(): r.queue_free() #Borrar filas
	sort_scores()
	
	for i in range(0, GameGlobal.scores.size()):
		var lbl := Label.new()
		score_container.add_child(lbl)
		
		if custom_font:
			lbl.add_theme_font_override("font", custom_font)
			lbl.add_theme_font_size_override("font_size", font_size)
		
		var data: Dictionary = GameGlobal.scores[i]
		var txt := "#{0}. {1} {2}pts".format([i+1,data.name, data.score])
		if data.name == GameGlobal.last_game_played.get('name',''):
			lbl.add_theme_color_override('font_color', Color.YELLOW)
		lbl.text = txt
