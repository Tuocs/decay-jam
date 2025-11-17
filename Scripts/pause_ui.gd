extends Control

#@export var Menu: PackedScene

func _on_button_pressed() -> void:
	visible = false


func _on_quit_pressed() -> void:
	#get_tree().change_scene_to_packed(Menu)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = !visible
