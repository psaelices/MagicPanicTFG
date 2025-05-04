extends SpawnAlgorithm
class_name SpawnAlgorithm_10

var toggle := true

func spawn(spawners: Array[MageSpawner]) -> Array[Mage]:
	var m: Mage = spawners[int(toggle)].spawn_mage() #int(toggle) retorna 0 o 1 si es verdadero o falso
	toggle = !toggle
	
	return [m]

#Usando timer default (3 segundos)
