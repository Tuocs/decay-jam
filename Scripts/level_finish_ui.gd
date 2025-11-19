extends Control

#@export var next_level: PackedScene
#@export var menu: PackedScene


func _on_button_3_pressed() -> void:
	TransitionUi.scene_transition(0)
	pass


func _on_quit_pressed() -> void:
	TransitionUi.scene_transition(0)
	pass
