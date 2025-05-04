extends State

func start(_args: Dictionary = {}):
	mage.sprite.play('explode')
	mage.particle_sprite.show()
	mage.sprite.animation_finished.connect(_anim_finished)
	mage.particle_sprite.play("default")
	
	mage.input_pickable = false
	
func _anim_finished():
	state_machine.transition_to('death')

func end():
	mage.sprite.animation_finished.disconnect(_anim_finished)
