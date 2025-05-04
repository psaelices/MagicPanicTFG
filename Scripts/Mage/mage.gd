extends CharacterBody2D
class_name Mage

signal exploded

@onready var sprite: AnimatedSprite2D = $MageSprite
@onready var state_machine: StateMachine = $StateMachine

@onready var particle_sprite: AnimatedSprite2D = $ParticlesSprite

@onready var charge_timer: Timer = $ChargeTimer
@onready var explosion_timer: Timer = $ExplosionTimer

var type: String = 'blue'

var charging: bool = false
var is_exploded: bool = false

var is_picked: bool =  false

func _ready() -> void:
	charge_timer.timeout.connect(charge)
	explosion_timer.timeout.connect(explode)

func charge()->void:
	if is_exploded: return
	explosion_timer.start()
	charging = true
	if is_picked: return
	state_machine.transition_to('charge')

func explode() -> void:
	if is_exploded: return
	state_machine.transition_to('explode')
	is_exploded = true

func exit_screen(exit_dir: Vector2) -> void:
	charge_timer.stop()
	explosion_timer.stop()
	
	state_machine.transition_to('transition', {'direction': exit_dir, 'delete_at_end': true})

func load_sprites(_type: String) -> void:
	var frames: SpriteFrames
	type = _type
	match type:
		'blue':
			frames = load("res://sprites/animations/blue_mage_animation.tres")
		'red':
			frames = load("res://sprites/animations/red_mage_animation.tres")
	
	sprite.sprite_frames = frames

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		if GameGlobal.picked_character == null:
			state_machine.transition_to('picked')
