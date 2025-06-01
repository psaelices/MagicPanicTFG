extends Node

var picked_character: Mage = null

var points: int = 0
var last_game_played: Dictionary = {}

var scores: Array[Dictionary] = [
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

signal point_scored
signal game_over

func increment_points():
	points += 1
	point_scored.emit(points)


func reset_values():
	points = 0
	picked_character = null
