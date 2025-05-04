extends State

func start(_args: Dictionary = {}):
	mage.set_collision_layer_value(1, false)
	mage.set_collision_mask_value(2, false)
	mage.sprite.play('picked_up')
	mage.is_picked = true
	
	GameGlobal.picked_character = mage
	
func physics(_delta: float):
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if mage.charging:
			state_machine.transition_to('charge')
		else:
			state_machine.transition_to('roam', {'play_anim': true})
		return
	
	var mouse_pos := mage.get_global_mouse_position()
	mage.global_position = mouse_pos

func end():
	mage.set_collision_layer_value(1, true)
	mage.set_collision_mask_value(2, true)
	mage.is_picked = false
	GameGlobal.picked_character = null
