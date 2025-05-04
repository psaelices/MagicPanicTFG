extends State

func start(_args: Dictionary = {}):
	mage.sprite.play('death')
	
	mage.sprite.animation_finished.connect(_anim_finished)
	mage.input_pickable = false

func _anim_finished():
	mage.exploded.emit()
