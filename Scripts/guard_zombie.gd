extends "res://Scripts/zombie.gd"

var zombified = false

func _process(delta: float) -> void:
	# Only play animations after zombify animation is done
	if zombified:
		super(delta)

func swap_to_idle_after_zombify() -> void:
	animator.animation_finished.disconnect(swap_to_idle_after_zombify)
	zombified = true
