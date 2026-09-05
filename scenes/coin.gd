extends Area2D

@export var value: int = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var pickupsound: AudioStreamPlayer2D = $pickupsound

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if not is_inside_tree():
			return
		collision_shape_2d.set_deferred("disabled", true)
		animated_sprite_2d.visible = false
		
		GameController.coin_collected(value)
		if is_inside_tree():
			pickupsound.play()
			await pickupsound.finished
			self.queue_free()
