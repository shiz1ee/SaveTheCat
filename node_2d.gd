extends Node2D

@onready var level_1_button: Button = $HBoxContainer/level1button
@onready var level_2_button: Button = $HBoxContainer/level2button

func _ready() -> void:
	level_1_button.disabled = false
	if GameController.ulocked_level >=2:
		level_2_button.disabled = false
	else:
		level_2_button.disabled = true

func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_2.tscn")
	


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_1.tscn")
