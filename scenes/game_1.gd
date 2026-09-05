extends Node2D

@onready var coin_label: Label = $CanvasLayer/Coinlabel
@onready var hearts: Array = [
	$CanvasLayer/Heartscontainer/Heart1,
	$CanvasLayer/Heartscontainer/Heart2,
	$CanvasLayer/Heartscontainer/Heart3
]

func _ready() -> void:
	GameController.total_coins = 0 
	coin_label.text = "Coins: 0"
	
	update_hearts_ui(GameController.lives)
	
	EventController.connect("coin_collected", on_event_coin_collected)
	EventController.connect("lives_changed", on_event_lives_changed)
	GameController.play_music(preload("res://assets/music/emmntt_-_i_think_id_stay_jungle_chill.wav"))
	
func on_event_coin_collected(value: int) -> void:
	coin_label.text = "Coins: " + str(value)
	
	if GameController.total_coins > 3:
			GameController.total_coins = 0
			GameController.unlock_next_level(2)
			get_tree().call_deferred("change_scene_to_file", "res://scenes/game_2.tscn")

func on_event_lives_changed(current_lives: int) -> void:
	update_hearts_ui(current_lives)
	
func update_hearts_ui(current_lives: int) -> void:
	print("currwnt lives receied: ", current_lives)
	for i in range(hearts.size()):
		hearts[i].visible = i < current_lives
