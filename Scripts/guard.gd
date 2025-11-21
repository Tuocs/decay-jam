extends "res://Scripts/unit.gd"

var current_time = 0
var move_time = 0
@onready var light: PointLight2D = $PointLight2D
@export var my_tuple_dict: Dictionary[Node2D, int]
var pathing_list_pos = 0
var lightStartPos: Vector2
var keys_array
var values_array

func _ready() -> void:
	if my_tuple_dict.size() == 0:
		printerr("no path assigned")
	super()
	lightStartPos = light.position
	keys_array = my_tuple_dict.keys()
	values_array = my_tuple_dict.values()
	move_time = current_time + values_array[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	try_new_move()
	current_time += delta
	
	# Walking animation
	if walking:
		direction_facing()
		animator.play("walk")
	# Idle animation
	else:
		animator.play("idle")

func try_new_move():
	if walking == false && move_time < current_time:
		pathing_list_pos += 1
		if pathing_list_pos >= my_tuple_dict.size():
			pathing_list_pos = 0
		move_time = current_time + values_array[pathing_list_pos]
		print(move_time)
		set_new_target_pos(keys_array[pathing_list_pos].position)

func direction_facing() -> void:
	if velocity.x > 0.1:
		sprite.flip_h = true
		light.scale.x = -1
		light.position.x = -lightStartPos.x
	else:
		sprite.flip_h = false
		light.scale.x = 1
		light.position.x = lightStartPos.x
