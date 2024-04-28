# Base class for all states
class_name CubieState
extends Object
var rng = RandomNumberGenerator.new()  # Create a RandomNumberGenerator

func set_seed(seed: int):
	rng.seed = seed
	
func enter(cubie: Node3D):
	pass

func exit(cubie: Node3D):
	pass
