extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("Player"):
		print("You died!!")
		timer.start()


func _on_timer_timeout() -> void:
	GameController.total_coins = 0
	GameController.love_life()
	if GameController.lives > 0:
		get_tree().reload_current_scene()
	else:
		GameController.lives = 3
		get_tree().change_scene_to_file("res://gameover.tscn")
