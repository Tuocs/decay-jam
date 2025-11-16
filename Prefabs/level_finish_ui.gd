extends Control

@export var next_level: PackedScene
@export var menu: PackedScene



func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_packed(next_level)


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
