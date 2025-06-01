extends State

var direction: Vector2 = Vector2.ZERO
# var speed: float = 80

var dir_timer: Timer
var dir_switch_time: float = 1.5

func start(args: Dictionary = {}):
	randomize_direction()
	dir_timer = make_timer()
	
	dir_timer.timeout.connect(randomize_direction)
	
	if mage.type in ['red_special', 'blue_special']:
		dir_timer.timeout.connect(randomize_direction)
	else:
		if args.has("direction"):
			direction = args.direction
		else:
			dir_timer.timeout.connect(randomize_direction)
	
	if args.has('play_anim'): 
		#Hay un crash cuando se intenta reproducir la animacion al inicializar ya que los nodos no estan cargados
		#Por eso requiere un parametro para saltarselo en la inicialización
		mage.sprite.play('walk')

func physics(_delta):
	var collision = mage.move_and_collide(direction * mage.speed * _delta)
	if collision:
		direction = direction.bounce(collision.get_normal()).normalized()
		if mage.sprite:
			mage.sprite.flip_h = direction.x < 0


func randomize_direction():
	direction.x = randf_range(-1,1)
	if mage.sprite:
		mage.sprite.flip_h = direction.x < 0
	
	direction.y = randf_range(-1,1)
	direction = direction.normalized()
	

func make_timer()->Timer:
	var t := Timer.new()
	add_child(t)
	if mage.type in ['red_special', 'blue_special']:
		t.start(dir_switch_time)
	else:
		t.start(dir_switch_time+10)

	return t

func end():
	dir_timer.timeout.disconnect(randomize_direction)
	dir_timer = null
	
