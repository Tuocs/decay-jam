extends Control

func _on_button_pressed() -> void:
	visible = false


func _on_quit_pressed() -> void:
	TransitionUi.scene_transition(0)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = !visible
