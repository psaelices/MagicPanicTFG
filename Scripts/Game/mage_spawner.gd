extends Node2D
class_name MageSpawner

var mage_scene: PackedScene = load("res://Scenes/Mage/mage.tscn")

##Direccion a la que caminan los magos al ser creados
@export var direction: Vector2

func spawn_mages(n: int) -> Array[Mage]:
	var mages: Array[Mage] = []
	for i in range(0,n):
		mages.append(spawn_mage())
	
	return mages

func spawn_mage()-> Mage:
	var mage: Mage = mage_scene.instantiate()
	get_parent().add_child(mage) #Agregar al mago como hijo de la escena game
	
	#Obtener color aleatorio
	var color: String = 'blue' if randf() > 0.5 else 'red'
	mage.load_sprites(color)
	
	#Posicion del mago
	mage.global_position = self.global_position
	
	#Ejecutar transicion de entrada a pantalla
	mage.state_machine.transition_to('transition', {'direction': direction, 'delete_at_end': false})
	return mage
