extends Node

# All zombies currently in this light's range
var inLight: Array[Node2D]
# This light's Area2D, used in Light Switch toggle code
@export var areaColl: Area2D
@export var pointLight: PointLight2D

# The rate at which this light does damage, every X seconds
var damageRate = 0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for entity in inLight:
		if entity.health <= 0:
			inLight.erase(entity)
			entity.dead = true
		else:
			deal_damage(entity, delta)
	
func deal_damage(entity: Node2D, delta: float) -> void:
	entity.damageTimer += delta
		
	# Deals 1 damage every damageRate seconds
	if entity.damageTimer > damageRate:
		entity.damageTimer = 0
		entity.health -= 1
		print(entity.name, " took damage! HP: ", entity.health)

func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent().is_in_group("Zombie"):
		inLight.append(area.get_parent())

func _on_area_2d_area_exited(area: Area2D):
	if area.get_parent() in inLight:
		inLight.erase(area.get_parent());
