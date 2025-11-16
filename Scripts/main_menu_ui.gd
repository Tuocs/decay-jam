extends Control

@export var level_1: PackedScene
@export var level_2: PackedScene
@export var level_3: PackedScene
@export var level_4: PackedScene

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_1)


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_packed(level_2)


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_packed(level_3)


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_packed(level_4)


func _on_quit_pressed() -> void:
	get_tree().quit()
