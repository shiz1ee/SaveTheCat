extends Control

@onready var volume_slider: HSlider = $VBoxContainer/HSlider
@onready var mute_button: CheckButton = $VBoxContainer/CheckButton
@onready var back_button: Button = $VBoxContainer/Button

var music_bus_index: int
	
func _ready() -> void:
	music_bus_index = AudioServer.get_bus_index("Music")
		
	var current_db: float = AudioServer.get_bus_volume_db(music_bus_index)
	volume_slider.value = db_to_linear(current_db)
		
	mute_button.button_pressed = AudioServer.is_bus_mute(music_bus_index)
		
	volume_slider.value_changed.connect(_on_volume_slider_value_changed)
	mute_button.toggled.connect(_on_mute_button_toggled)
	back_button.pressed.connect(_on_back_button_pressed)
		
func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(value))
		
	if value > 0 and AudioServer.is_bus_mute(music_bus_index):
		AudioServer.set_bus_mute(music_bus_index, false)
		mute_button.button_pressed = false
func _on_mute_button_toggled(is_muted: bool) -> void:
	AudioServer.set_bus_mute(music_bus_index, is_muted)
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_on_back_button_pressed()
			
