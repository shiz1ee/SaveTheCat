extends Node

var total_coins: int = 0

func coin_collected(value: int):
	total_coins += value
	EventController.emit_signal("coin_collected", total_coins)
	
var lives: int = 3
func love_life() -> void:
	lives -= 1
	EventController.emit_signal("lives_changed", lives)
	
var ulocked_level: int = 1
func unlock_next_level(level_number: int) -> void:
	if level_number > ulocked_level:
		ulocked_level = level_number

var music_player: AudioStreamPlayer


func _ready() -> void:
	music_player = AudioStreamPlayer.new()
	music_player.bus = "Music"
	add_child(music_player)
	
func play_music(stream: AudioStream) -> void:
	if music_player.stream == stream and music_player.playing:
		return
	music_player.stream = stream
	music_player.play()
	
