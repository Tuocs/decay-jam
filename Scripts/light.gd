extends Node

# All zombies currently in this light's range
var inLight: Array[Node2D]
@export var coll: CollisionShape2D
@export var pointLight: PointLight2D

# The rate at which this light does damage, every X seconds
var damageRate = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for entity in inLight:
		if entity.health <= 0:
			inLight.erase(entity)
			entity.queue_free()
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
	if area.get_parent().name.contains("Zombie"):
		inLight.append(area.get_parent())

func _on_area_2d_area_exited(area: Area2D):
	if area.get_parent() in inLight:
		inLight.erase(area.get_parent());
