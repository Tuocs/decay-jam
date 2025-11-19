extends Control

func _on_button_pressed() -> void:
	TransitionUi.scene_transition(1)


func _on_button_2_pressed() -> void:
	TransitionUi.scene_transition(2)


func _on_button_3_pressed() -> void:
	TransitionUi.scene_transition(3)


func _on_button_4_pressed() -> void:
	TransitionUi.scene_transition(4)


func _on_quit_pressed() -> void:
	get_tree().quit()
