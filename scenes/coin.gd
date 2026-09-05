extends Area2D

@export var value: int = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var pickupsound: AudioStreamPlayer2D = $pickupsound

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameController.coin_collected(value)
		
		collision_shape_2d.set_deferred("disabled", true)
		animated_sprite_2d.visible = false
		
		pickupsound.play()
		await pickupsound.finished
		self.queue_free()
