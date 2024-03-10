extends CharacterBody2D

signal health_depleted
var health: float = 1000.0

func _physics_process(delta):
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	const DAMAGE_RATE = 50.0
	var overlaping_mobs = %HurtBox.get_overlapping_bodies()
	if overlaping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlaping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
