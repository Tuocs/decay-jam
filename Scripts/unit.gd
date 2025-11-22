extends CharacterBody2D

var map: TileMapLayer
var mapSize: Vector2
var walking = false
@onready var sprite: Sprite2D = $Sprite2D
@onready var animator: AnimationPlayer = $AnimationPlayer
@export var speed = 100
var acceleration = 10
var target: Node2D
@onready var navigation_agent: NavigationAgent2D = $Nav/NavigationAgent2D

func _ready() -> void:
	map = get_node("/root/Level/GroundCanvasLayer/GroundTilemap")
	mapSize = map.get_used_rect().size * map.tile_set.tile_size
	print(mapSize)
	add_new_target_node()
	
func _process(delta: float) -> void:
	if walking:
		direction_facing()
	
func direction_facing() -> void:
	sprite.flip_h = true if velocity.x > 0.1 else false
	
func set_new_target_pos(new_pos: Vector2):
	# Gets the closest tile to the position clicked
	var closestTilePos = map.get_cell_atlas_coords(map.local_to_map(new_pos))
	# Only sets navigation position if the tile is valid
	if closestTilePos == Vector2i(-1, -1):
		print("Invalid tile clicked!")
		return
		
	if walking:
		return
	walking = true
	if !is_sibling_of(self, target):
		get_parent().add_child(target)
	target.position = new_pos
	navigation_agent.target_position = target.position
	
func set_new_target_node(new_tar: Node2D):
	if walking:
		return
	walking = true
	new_tar.add_child(target)
	target.position = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if (position.distance_to(target.position) < 10):
		walking = false
		return
	
	var direction = Vector2.ZERO
	
	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	
	move_and_slide()

func _on_timer_timeout():
	navigation_agent.target_position = target.global_position

func is_sibling_of(node1: Node, node2: Node) -> bool:
	# Check if both nodes exist and have a parent
	if node1 and node2 and node1.get_parent() and node2.get_parent():
		return node1.get_parent() == node2.get_parent()
	return false
	
func add_new_target_node():
	target = Node2D.new()
	target.name = "NodeTarget"
	get_parent().add_child.call_deferred(target)


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass
func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
