extends Node

var total_coins: int = 0

func coin_collected(value: int):
	total_coins += value
	EventController.emit_signal("coin_collected", total_coins)
	
var lives: int = 3
func love_life() -> void:
	lives -= 1
	EventController.emit_signal("lives_changed", lives)
