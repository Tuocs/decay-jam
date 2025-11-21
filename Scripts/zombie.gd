extends "res://Scripts/unit.gd"

var health = 10
var damageTimer = 0
var dead = false
var deathConnected = false

func _process(delta: float) -> void:
	if dead:
		if deathConnected == false:
			deathConnected = true
			animator.play("death")
			animator.animation_finished.connect(death)
		else:
			pass
	# Walking animation
	elif walking:
		direction_facing()
		animator.play("walk")
	# Selected animation
	elif get_parent().selected == self:
		animator.play("selected")
	# Idle animation
	else:
		animator.play("idle")

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("Select"):
			print("Sprite Clicked!")
			get_parent().selected = self
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Guard"):
		set_new_target_pos(position)
		walking = false
		get_parent().add_new_zombie(area.get_parent().position)
		area.get_parent().queue_free()
		#could play biting animation or something here
		#if needed could snap zombie to position for animations too
	
	if area.get_parent().is_in_group("Interactable"):
		set_new_target_pos(position)
		walking = false
		#call interact function or something on area.get_parent()
		#if needed could snap zombie to position for animations too

func death(anim_name: StringName) -> void:
	queue_free()
