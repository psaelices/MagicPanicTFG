extends Node2D

var mage_count: int = 0 #Magos generados

@onready var spawn_timer: Timer = $MageSpawnTime
@export var spawners: Array[MageSpawner]

var mages: Array[Mage] = []

##Metodo usado para spawnear magos
var current_spawn_algorithm: SpawnAlgorithm = SpawnAlgorithm.new()

func _on_mage_spawn_time_timeout() -> void:
	var mages: Array[Mage] = current_spawn_algorithm.spawn(spawners)
	for m in mages: add_mage(m) #Contar magos generados

func increment_mage_count():
	mage_count += 1
	
	match mage_count:
		10: current_spawn_algorithm = SpawnAlgorithm_10.new()
		20: current_spawn_algorithm = SpawnAlgorithm_20.new()
		30: current_spawn_algorithm = SpawnAlgorithm_30.new()
		50: current_spawn_algorithm = SpawnAlgorithm_50.new()
		80: current_spawn_algorithm = SpawnAlgorithm_80.new()
		120: current_spawn_algorithm = SpawnAlgorithm_120.new()
		150: current_spawn_algorithm = SpawnAlgorithm_150.new()
		200: current_spawn_algorithm = SpawnAlgorithm_200.new()
		280: current_spawn_algorithm = SpawnAlgorithm_280.new()
		
	
	spawn_timer.wait_time = current_spawn_algorithm.get_timer_delay()

func add_mage(m: Mage):
	mages.append(m)
	m.exploded.connect(_on_mage_exploded)
	increment_mage_count()

func _on_mage_exploded(): #Explotar al resto de magos
	disable_explode_connections()
	spawn_timer.stop()
	
	for m in mages:
		if !is_instance_valid(m) or m.is_exploded: continue #Brincarse al mago que explotó
		m.explode()
		
	GameGlobal.game_over.emit()

func disable_explode_connections() -> void:
	for m in mages: 
		if !is_instance_valid(m): continue
		m.exploded.disconnect(_on_mage_exploded)
