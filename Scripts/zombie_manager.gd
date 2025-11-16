extends Node2D

var my_group_nodes
var selected
var target

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
		print(get_global_mouse_position())
		selected.set_new_target_pos(get_global_mouse_position())
