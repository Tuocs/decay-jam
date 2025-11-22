extends Control

@export var next_level: int = 0
@onready var hasClicked: bool = false



func _on_quit_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	TransitionUi.scene_transition(0)
	pass


func _on_next_button_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	TransitionUi.scene_transition(next_level)
	pass


func _on_reload_button_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	TransitionUi.reload_scene()
	pass
