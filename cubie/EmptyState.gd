class_name EmptyState extends CubieState

func enter(cubie: Node3D):
	print("Cubie at ", cubie.global_transform.origin, " is now empty.")

func exit(cubie: Node3D):
	print("Exiting empty state.")
