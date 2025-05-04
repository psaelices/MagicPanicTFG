extends Button

##Se introduce el path relativo de la escena a la que se transicionará al hacer click en el botón.
@export var scene_path: String = ""


func _on_pressed() -> void:
	SceneManager.change_scene_to(scene_path)
