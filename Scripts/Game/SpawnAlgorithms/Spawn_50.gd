extends SpawnAlgorithm_10
class_name SpawnAlgorithm_50

func spawn(spawners: Array[MageSpawner])->Array[Mage]:
	var mages: Array[Mage] = spawners[int(toggle)].spawn_mages(2)
	
	return mages

func get_timer_delay():
	return 1.5
