extends Node2D

var my_group_nodes
var selected
var target
@onready var zombie_scene = preload("res://Prefabs/guard_zombie.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RefreshZombies()

func RefreshZombies():
	my_group_nodes = get_tree().get_nodes_in_group("Zombie")
	for node in my_group_nodes:
		print("Node in group: ", node.name)

func _input(event):
	if event.is_action_pressed("Hotkey1") && my_group_nodes.size() >= 1:
		selected = my_group_nodes[0]
	if event.is_action_pressed("Hotkey2") && my_group_nodes.size() >= 2:
		selected = my_group_nodes[1]
	if event.is_action_pressed("Hotkey3") && my_group_nodes.size() >= 3:
		selected = my_group_nodes[2]
	if event.is_action_pressed("Hotkey4") && my_group_nodes.size() >= 4:
		selected = my_group_nodes[3]
	if event.is_action_pressed("Hotkey5") && my_group_nodes.size() >= 5:
		selected = my_group_nodes[4]
	if event.is_action_pressed("Hotkey6") && my_group_nodes.size() >= 6:
		selected = my_group_nodes[5]
	if event.is_action_pressed("Hotkey7") && my_group_nodes.size() >= 7:
		selected = my_group_nodes[6]
	if event.is_action_pressed("Hotkey8") && my_group_nodes.size() >= 8:
		selected = my_group_nodes[7]
	if event.is_action_pressed("Hotkey9") && my_group_nodes.size() >= 9:
		selected = my_group_nodes[8]
	if event.is_action_pressed("Hotkey0") && my_group_nodes.size() >= 10:
		selected = my_group_nodes[9]
	if event.is_action_pressed("Order") && selected != null:
		var collision = get_area_in_group(get_global_mouse_position(), "Guard")
		if collision != null:
			selected.set_new_target_pos(get_global_mouse_position())
		else:
			selected.set_new_target_pos(get_global_mouse_position())

func add_new_zombie(_position: Vector2) -> void:
	var new_object = zombie_scene.instantiate()
	print("new zombie")
	add_child.call_deferred(new_object)
	new_object.position = _position
	RefreshZombies()

func is_position_in_group_area(position: Vector2, target_group: String) -> bool:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = position
	query.collide_with_areas = true # Ensure areas are considered
	
	var result = space_state.intersect_point(query)
	
	for overlap_data in result:
		var collider = overlap_data.collider
		if collider is Area2D and collider.is_in_group(target_group):
			return true
	return false

func get_area_in_group(position: Vector2, target_group: String) -> Area2D:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = position
	query.collide_with_areas = true # Ensure areas are considered
	
	var result = space_state.intersect_point(query)
	
	for overlap_data in result:
		var collider = overlap_data.collider
		if collider is Area2D and collider.is_in_group(target_group):
			return collider
	return null
