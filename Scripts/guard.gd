extends "res://Scripts/unit.gd"

var current_time = 0
var move_time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	try_new_move()
	current_time += delta
	
	# Walking animation
	if walking:
		direction_facing()
		animator.play("walk")
	# Idle animation
	else:
		animator.play("idle")

func try_new_move():
	if walking == false && move_time < current_time:
		move_time = current_time + randi_range(5, 10)
		print(move_time)
		set_new_target_pos(position + Vector2(randi_range(-50, 50), randi_range(-50, 50)))
