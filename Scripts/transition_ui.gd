extends Control

@export var fade_bar: ColorRect

var MenuScene
var Level1
var Level2
var Level3
var Level4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MenuScene = preload("res://Levels/Menu.tscn")
	Level1 = preload("res://Levels/TestLevel.tscn")
	Level2 = preload("res://Levels/TestLevel.tscn")
	Level3 = preload("res://Levels/TestLevel.tscn")
	Level4 = preload("res://Levels/TestLevel.tscn")
	if fade_bar == null:
		create_new_fade_bar()
	reveal_scene()


func scene_transition(level_to_load: int):
	await hide_scene()
	await get_tree().create_timer(0.5).timeout
	match level_to_load:
		0:
			get_tree().change_scene_to_packed(MenuScene)
		1:
			get_tree().change_scene_to_packed(Level1)
		2:
			get_tree().change_scene_to_packed(Level2)
		3:
			get_tree().change_scene_to_packed(Level3)
		4:
			get_tree().change_scene_to_packed(Level4)
		_:
			get_tree().change_scene_to_packed(MenuScene)
	if fade_bar == null:
		create_new_fade_bar()
	reveal_scene()

func reload_scene():
	await hide_scene()
	get_tree().reload_current_scene()
	await get_tree().create_timer(0.2).timeout
	if fade_bar == null:
		create_new_fade_bar()
	reveal_scene()

func reveal_scene():
	if fade_bar == null:
		create_new_fade_bar()
	for i in range(100):
		fade_bar.size.x = (100-i)*30
		await get_tree().process_frame 

func hide_scene():
	if fade_bar == null:
		create_new_fade_bar()
	for i in range(100):
		fade_bar.size.x = i*30
		await get_tree().process_frame 
		
func create_new_fade_bar():
	var fade_bar_canvas = CanvasLayer.new()
	fade_bar_canvas.layer = 4000
	add_child(fade_bar_canvas)
	fade_bar = ColorRect.new()
	fade_bar_canvas.add_child(fade_bar)
	fade_bar.set_anchors_and_offsets_preset(PRESET_FULL_RECT)
	fade_bar.color = Color(0.024, 0.039, 0.024, 1.0)
	fade_bar.size = Vector2(3000, 6000)
	fade_bar.position = Vector2(0, -2700)
	fade_bar.rotation_degrees = 33
	fade_bar.z_index = 4096
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Reload"):
		reload_scene()
