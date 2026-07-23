extends CharacterBody2D


const SPEED = 100.0

var health: int = 100
var target :Node2D = null

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var take_damage_sound = $TakeDamage

func _physics_process(delta: float) -> void:
	if target:
		_attack(delta)


func _attack(delta: float) -> void:
	var direction = (target.position - position).normalized()
	position += direction * SPEED * delta
	animated_sprite_2d.play("attack")
	

func take_damage(damage:int) -> void:
	health -= damage
	print(health)
	take_damage_sound.play()

func _on_sight_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target = body


func _on_sight_body_exited(body):
	if body.name == "Player":
		target = null
		animated_sprite_2d.play("idle")
