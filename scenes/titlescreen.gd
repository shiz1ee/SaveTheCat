extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.play_music(preload("res://assets/music/pixelloop.mp3"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Leveltransition.change_scene_to("res://scenes/node_2d.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_texture_button_pressed() -> void:
	pass # Replace with function body.
	


func _on_setting_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settingsmenu.tscn")
