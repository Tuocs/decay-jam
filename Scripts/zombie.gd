extends "res://Scripts/unit.gd"

var health = 10
var damageTimer = 0

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("Select"):
			print("Sprite Clicked!")
			get_parent().selected = self
