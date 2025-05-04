extends SpawnAlgorithm_150
class_name SpawnAlgorithm_280
# 150 magos: se empezaran a generar magos 
#en tandas de 2 por arriba y por abajo al mismo tiempo cada 2 segundos.

func spawn(spawners: Array[MageSpawner])-> Array[Mage]:
	var mages: Array[Mage] = spawners[0].spawn_mages(3)
	mages.append_array(spawners[1].spawn_mages(3))
	
	return mages
	
#Usando timer de SpawnAlgorithm_150 (2 segundos)
