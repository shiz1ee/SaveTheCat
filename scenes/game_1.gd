extends Node2D

func _ready() -> void:
	EventController.connect("coin_collected",on_event_coin_collected)
	
func on_event_coin_collected(value: int) -> void:
	if GameController.total_coins > 3:
		get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
	
