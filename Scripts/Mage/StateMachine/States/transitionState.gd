extends State

var tween: Tween

var delete_at_end: bool = false

var initial_direction: Vector2

func start(args: Dictionary = {}):
	#Deshabilitar collision con muros para atravesarlos
	mage.set_collision_mask_value(2,false)
	
	mage.sprite.play('walk')

	tween = get_tree().create_tween()
	
	delete_at_end = args.delete_at_end
	
	mage.sprite.flip_h = args.direction.x < 0
	
	var distance:float = args.get("distance", 100.0)
	var final_pos: Vector2 = mage.global_position + args.direction * distance
	initial_direction = args.direction
	tween.tween_property(mage,"global_position",final_pos,.5)
	tween.finished.connect(_on_tween_finished)


func _on_tween_finished():
	state_machine.transition_to('roam', {"direction": initial_direction}) #CAMBIO


func end():
	mage.set_collision_mask_value(2,true)
	tween.finished.disconnect(_on_tween_finished)
	if delete_at_end: mage.queue_free()
