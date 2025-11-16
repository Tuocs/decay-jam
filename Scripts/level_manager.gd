extends Node2D

@export var level_finish_ui: Control

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Zombie"):
		level_finish_ui.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_parent().is_in_group("Zombie"):
		level_finish_ui.visible = true
