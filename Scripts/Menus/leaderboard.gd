extends Control
class_name Leaderboard

@export var custom_font: Font
@export var font_size: int = 24


@export var scores: Array[Dictionary] = [
	{'name': 'ShadowBlitz','score': 10},
	{'name': 'PixelRider','score': 20},
	{'name': 'NovaFury','score': 30},
	{'name': 'CryoHex','score': 40},
	{'name': 'IronGhost','score': 50},
	{'name': 'LunaStrike','score': 100},
	{'name': 'ByteHunter','score': 150},
	{'name': 'Z3r0Fox','score': 200},
	{'name': 'LiveHidralisk','score': 250},
]

@onready var score_container: VBoxContainer = $PanelContainer/MarginContainer/Leaderboard/ScrollContainer/ScoreContainer

func _ready() -> void:
	refrescar()

##Reordena los puntajes de mayor a menor
func sort_scores()->void:
	scores.sort_custom(func(a: Dictionary, b: Dictionary): return a.score >= b.score)

##Actualiza los puntajes mostrados
func refrescar()->void:
	for r in score_container.get_children(): r.queue_free() #Borrar filas
	sort_scores()
	
	for i in range(0, scores.size()):
		var lbl := Label.new()
		score_container.add_child(lbl)
		
		if custom_font:
			lbl.add_theme_font_override("font", custom_font)
			lbl.add_theme_font_size_override("font_size", font_size)
		
		var data: Dictionary = scores[i]
		var txt := "#{0}. {1} {2}pts".format([i+1,data.name, data.score])
		lbl.text = txt
