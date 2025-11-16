extends TileMapLayer

var astargrid = AStarGrid2D.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_grid()


func setup_grid():
	astargrid.region = Rect2i(0,0, 32, 18)
	astargrid.cell_size = Vector2i(40,40)
	astargrid.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astargrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	astargrid.update()
	for cell in get_used_cells():
		astargrid.set_point_solid(cell, is_spot_solid(cell))
	
func is_spot_solid(spot_to_check: Vector2i) -> bool:
	return get_cell_tile_data(spot_to_check).get_custom_data("is_solid")
	
func get_path_to_target(start_pos: Vector2i, target_pos: Vector2i):
	return astargrid.get_id_path(start_pos, target_pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
