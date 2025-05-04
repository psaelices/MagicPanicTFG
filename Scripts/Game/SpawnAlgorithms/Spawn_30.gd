extends SpawnAlgorithm_20
class_name SpawnAlgorithm_30

func spawn(spawners: Array[MageSpawner]) -> Array[Mage]:
	var m1: Mage = spawners[0].spawn_mage()
	var m2: Mage = spawners[1].spawn_mage()
	
	return[m1, m2]

#Usando timer de SpawnAlgorithm_20 (1.5 segundos)
