extends Node
class_name StateMachine

var states: Dictionary = {}
var current_state: State
@export var initial_state: String = ''

func _ready() -> void:
	
	for state in get_children():
		var key := normalize_state_name(state.name)
		states[key] = state
		state.state_machine = self
		
	initial_state = normalize_state_name(initial_state)
	
	if states.has(initial_state):
		current_state = states[initial_state]
		current_state.start()
	else:
		print('STATE MACHINE ERROR: El estado inicial {0} no existe.'.format(initial_state))

func _physics_process(delta: float) -> void:
	current_state.physics(delta)

func transition_to(new_state: String, args: Dictionary = {}):
	current_state.end()
	
	var key: String = normalize_state_name(new_state)
	
	if states.has(key):
		current_state = states[key]
		current_state.start(args)
	else:
		print('STATE MACHINE ERROR: El estado {0} no existe.'.format(initial_state))

func normalize_state_name(state_name: String) -> String:
	return state_name.to_upper()
