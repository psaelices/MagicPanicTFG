extends Node2D
class_name MageSpawner

var mage_scene: PackedScene = load("res://Scenes/Mage/mage.tscn")

##Direccion a la que caminan los magos al ser creados
@export var direction: Vector2
var _pending_directions: Array[Vector2] = []

func get_random_spawn_direction() -> Vector2:
	var base = direction.normalized()
	var left = (direction + Vector2(-0.5, 0)).normalized()
	var right = (direction + Vector2(0.5, 0)).normalized()

	var variations = [base, left, right]
	return variations[randi() % variations.size()]

func spawn_mages(n: int) -> Array[Mage]:
	var mages: Array[Mage] = []
	var base = direction.normalized()
	var left = (direction + Vector2(-0.5, 0)).normalized()
	var right = (direction + Vector2(0.5, 0)).normalized()
	
	if n == 1:
		_pending_directions = [ [base, left, right].pick_random() ]
	elif n == 2:
		_pending_directions = [left, right]
	elif n >= 3:
		_pending_directions = [left, base, right]
	else:
		_pending_directions = []

	for i in range(n):
		mages.append(spawn_mage())
	return mages

func spawn_mage()-> Mage:
	var mage: Mage = mage_scene.instantiate()
	get_parent().add_child(mage) #Agregar al mago como hijo de la escena game
	
	#Obtener color aleatorio
	var color: String = 'blue' if randf() > 0.5 else 'red'
	var type: String 
	var roll := randf()
	
	if color == 'blue':
		if roll < 0.6:
			type = 'blue'
		elif roll < 0.9:
			type = 'blue_rare'
		else:
			type = 'blue_special'
	else:
		if roll < 0.6:
			type = 'red'
		elif roll < 0.9:
			type = 'red_rare'
		else:
			type = 'red_special'
	
	mage.load_sprites(type)
	
	#Posicion del mago
	mage.global_position = self.global_position
	
	var spawn_dir: Vector2
	
	if _pending_directions.size() > 0:
		spawn_dir = _pending_directions.pop_front()
	else:
		spawn_dir = get_random_spawn_direction()

	mage.state_machine.transition_to("transition", {
		"direction": spawn_dir,
		"distance": 100.0,
		"delete_at_end": false
	})
	
	return mage
