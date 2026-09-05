extends Node2D

const SPEED = 60 

var direction = 1
var can_attack: bool = true

@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):
	if ray_castright.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_castleft.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta


func _on_hitbox_body_entered(body: Node2D) -> void:
	if (body.name == "Player" or body.is_in_group("Player")) and can_attack:
		can_attack = false
		Engine.time_scale = 0.5
		GameController.love_life()
		Engine.time_scale = 1
		
		if GameController.lives <= 0:
			GameController.lives = 3
			get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
		else:
			await get_tree().create_timer(1.0).timeout
			can_attack = true
			
