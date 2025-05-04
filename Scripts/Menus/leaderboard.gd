extends Control
class_name Leaderboard

@export var scores: Array[Dictionary] = [
	{'name': 'ejemplo','score': 10},
	{'name': 'ejemplo','score': 20},
	{'name': 'ejemplo','score': 30},
	{'name': 'ejemplo','score': 40},
	{'name': 'ejemplo','score': 50},
	{'name': 'ejemplo','score': 100},
	{'name': 'ejemplo','score': 150},
	{'name': 'ejemplo','score': 200},
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
		
		var data: Dictionary = scores[i]
		var txt := "#{0}. {1} {2}pts".format([i+1,data.name, data.score])
		lbl.text = txt
