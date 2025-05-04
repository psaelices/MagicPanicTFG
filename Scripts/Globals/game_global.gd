extends Node

var picked_character: Mage = null

var points: int = 0

signal point_scored
signal game_over

func increment_points():
	points += 1
	point_scored.emit(points)


func reset_values():
	points = 0
	picked_character = null
