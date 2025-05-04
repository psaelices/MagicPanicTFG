extends Object
class_name SpawnAlgorithm
## Clase base para los algoritmos de spawneo

##Modificar como spawnean los magos
#Siempre debe retornar los magos generados para que funcione el juego
func spawn(spawners: Array[MageSpawner])->Array[Mage]:
	var m: Mage = spawners[0].spawn_mage()
	return [m]

##Cambia el tiempo entre cada mago
func get_timer_delay()->float:
	return 3.0
