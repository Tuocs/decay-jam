extends Node

@export var light: Node2D
@export var switchSprite2D: Sprite2D
@export var enabledSprite: AtlasTexture
@export var disabledSprite: AtlasTexture
var active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().name.contains("Zombie"):
		toggle_switch(!active)

func toggle_switch(value: bool) -> void:
	active = value
	print("toggled!")
	if active == true:
		switchSprite2D.texture = enabledSprite
		light.pointLight.show()
		light.coll.set_deferred("disabled", false)
	else:
		switchSprite2D.texture = disabledSprite
		light.pointLight.hide()
		light.coll.set_deferred("disabled", true)
	pass
