extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 800
	const RANGE = 1000
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	
	if travelled_distance >= RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(100)
