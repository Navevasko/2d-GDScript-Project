extends CharacterBody2D

@onready var player: CharacterBody2D = get_node("/root/Game/Player")
var health = 200

func _ready():
		%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()

	if player.global_position == global_position:
		velocity = Vector2(0, 0)
	
	if velocity.length() == 0:
		%Slime.play_idle()

func take_damage(damage_taken: float):
	health -= damage_taken
	%Slime.play_hurt()
	
	if health <= 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
