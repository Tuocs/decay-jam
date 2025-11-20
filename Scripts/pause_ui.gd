extends Control

@onready var hasClicked: bool = false

func _on_button_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	visible = false


func _on_quit_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	TransitionUi.scene_transition(0)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = !visible
