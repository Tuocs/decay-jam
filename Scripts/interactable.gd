extends Node

@onready var animator: AnimationPlayer = $AnimationPlayer

# All guards currently in this interactable's range
var inRange: Array[Node2D]

var used: bool = false

	
func on_range_enter(area: Area2D) -> void:
	if area.get_parent().is_in_group("Guard"):
		inRange.append(area.get_parent())
	
func on_range_exit(area: Area2D) -> void:
	if area.get_parent().is_in_group("Guard"):
		inRange.erase(area.get_parent())

func on_close_range_enter(area: Area2D) -> void:
	# Stop guards for a bit
	if area.get_parent().is_in_group("Guard") and area.get_parent() in inRange and used:
		area.get_parent().set_new_target_pos(area.get_parent().position)
		
		await get_tree().create_timer(3.0).timeout # waits for 3 seconds
		
		area.get_parent().navigationOverride = false

func on_mouse_click() -> void:
	animator.play("used")
	used = true
	# Draw any guards close
	for guard in inRange:
		guard.navigationOverride = true
		guard.set_new_target_pos(self.position)

func on_mouse_hover() -> void:
	animator.play("selected")
	
func on_mouse_unhover() -> void:
	animator.play("default")
