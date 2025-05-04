extends SpawnAlgorithm
class_name SpawnAlgorithm_150
# 150 magos: se empezaran a generar magos 
#en tandas de 2 por arriba y por abajo al mismo tiempo cada 2 segundos.

func spawn(spawners: Array[MageSpawner])-> Array[Mage]:
	var mages: Array[Mage] = spawners[0].spawn_mages(2)
	mages.append_array(spawners[1].spawn_mages(2))
	
	return mages
	

func get_timer_delay():
	return 2.0
