extends "res://Scripts/unit.gd"

var idle = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	try_new_move()

func try_new_move():
	if walking == false && idle == false:
		idle = true
		await get_tree().create_timer(3).timeout
		idle = false
		set_new_target_pos(map.local_to_map(position) + Vector2i(randi_range(-5, 5), randi_range(-5, 5)))
