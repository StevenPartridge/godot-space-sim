extends Node3D

@export var size: float = 1000.0
@export var state_scene: PackedScene

var current_state: CubieState = null

func _ready():
	randomize_content()

func randomize_content():
	var new_state_type = [EmptyState, AsteroidsState, StationState]
	var chosen_state = new_state_type[randi() % new_state_type.size()].new()
	switch_state(chosen_state)

func switch_state(new_state: CubieState):
	if current_state:
		current_state.exit(self)
	current_state = new_state
	current_state.set_seed(1)
	current_state.enter(self)
	
