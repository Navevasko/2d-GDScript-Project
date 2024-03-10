extends Node2D

func _ready():
	%Game_Over.visible = false
	get_tree().paused = false


func spawn_enemy():
	var new_enemy = preload("res://enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)


func _on_timer_timeout():
	%Timer.wait_time = randf()
	spawn_enemy()


func _on_player_health_depleted():
	%Game_Over.visible = true
	get_tree().paused = true
