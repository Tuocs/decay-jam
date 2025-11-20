extends Control

#@export var next_level: PackedScene
#@export var menu: PackedScene
@onready var hasClicked: bool = false


func _on_button_3_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	TransitionUi.scene_transition(0)
	pass


func _on_quit_pressed() -> void:
	if hasClicked == true:
		return
		
	hasClicked = true
	TransitionUi.scene_transition(0)
	pass
