extends CharacterBody2D
class_name Mage

signal exploded

@onready var sprite: AnimatedSprite2D = $MageSprite
@onready var state_machine: StateMachine = $StateMachine

@onready var particle_sprite: AnimatedSprite2D = $ParticlesSprite

@onready var charge_timer: Timer = $ChargeTimer
@onready var explosion_timer: Timer = $ExplosionTimer

@onready var sfx_player: AudioStreamPlayer2D = $SFXPlayer
@onready var point_audio: AudioStreamPlayer2D = $AreaPoint


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
		'red':
			frames = load("res://sprites/animations/red_mage_animation.tres")
		'red_rare':
			frames = load("res://sprites/animations/red_rare_animation.tres")
		'red_special':
			frames = load("res://sprites/animations/red_special_animation.tres")
		'blue':
			frames = load("res://sprites/animations/blue_mage_animation.tres")
		'blue_rare':
			frames = load("res://sprites/animations/blue_rare_animation.tres")
		'blue_special':
			frames = load("res://sprites/animations/blue_special_animation.tres")
	sprite.sprite_frames = frames

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		if GameGlobal.picked_character == null:
			state_machine.transition_to('picked')

func play_sound_effect(sound_path: String) -> void:
	var sound = load(sound_path)
	point_audio.stream = sound
	point_audio.play()

func _on_mage_sprite_frame_changed() -> void:
	match sprite.animation:
		"walk":
			if sprite.frame in [2, 6]:
				sfx_player.stream = load("res://Assets/sound_effects/mages_steps.wav")
				sfx_player.play()
		
		"charge":
			if sprite.frame in [0, 2, 4, 6,]:
				sfx_player.stream = load("res://Assets/sound_effects/casting_spell.wav")
				sfx_player.play()
		
		"explode":
			if sprite.frame == 6:
				sfx_player.stream = load("res://Assets/sound_effects/explosion.wav")
				sfx_player.play()
				
		"picked_up":
			if sprite.frame == 1:
				sfx_player.stream = load("res://Assets/sound_effects/dragging_mages.wav")
				sfx_player.play()
