extends Node2D

var map
var walking

func _ready() -> void:
	map = get_node("/root/Level/TileMapLayer")

	
func set_new_target_pos(new_pos: Vector2):
	if walking:
		return
	walking = true
	var path = map.get_path_to_target(map.local_to_map(position), map.local_to_map(new_pos))
	for cell in path:
		position = map.map_to_local(cell)
		await get_tree().create_timer(0.2).timeout
	walking = false



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass
