extends Node

@export var light: Node2D
@export var switchSprite2D: Sprite2D
@export var enabledSprite: AtlasTexture
@export var disabledSprite: AtlasTexture
@export var isOn: bool = true
@export var glowLight: PointLight2D

@export var onColor: Color
@export var offColor: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle_switch(isOn)

func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().is_in_group("Zombie"):
		toggle_switch(!isOn)

func toggle_switch(value: bool) -> void:
	isOn = value
	print("toggled!")
	if isOn == true:
		switchSprite2D.texture = enabledSprite
		light.toggle_light(true)
		# Set glow color
		glowLight.color = onColor
	else:
		switchSprite2D.texture = disabledSprite
		light.toggle_light(false)
		# Set glow color
		glowLight.color = offColor
	pass
