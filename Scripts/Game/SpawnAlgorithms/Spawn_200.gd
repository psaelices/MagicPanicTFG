extends SpawnAlgorithm_10
class_name SpawnAlgorithm_200

# 200 magos: se generaran en tandas de 3 intercalando arriba y abajo 
# cada 2 segundos

func spawn(spawners: Array[MageSpawner])->Array[Mage]:
	var mages := spawners[int(toggle)].spawn_mages(3)
	toggle = !toggle
	return mages

func get_timer_delay():
	return 2.0
