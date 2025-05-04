extends Area2D
class_name DropZone

@export var type: String = 'blue'
@export var exit_dir: Vector2 = Vector2.ZERO

func _on_mage_entered(mage: Mage) -> void:
	print(mage)
	if mage.type == type:
		print('mage exiting')
		mage.exit_screen(exit_dir)
		GameGlobal.increment_points()
	else:
		mage.explode()
