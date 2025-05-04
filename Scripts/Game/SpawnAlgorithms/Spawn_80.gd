extends SpawnAlgorithm_50
class_name SpawnAlgorithm_80

#- 80 magos: se generaran magos en tandas de 3 y 2 
# sucesivamente e intercalando arriba y abajo.
func spawn(spawners: Array[MageSpawner])-> Array[Mage]:
	var extra := int(toggle) #Se utiliza para agregar un mago extra
	var mages: Array[Mage] = spawners[extra].spawn_mages(2+extra)
	
	toggle = !toggle
	
	return mages

#Usando timer de SpawnAlgorithm_50 (1.5 segundos)
