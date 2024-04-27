class_name AsteroidsState extends CubieState

func enter(cubie: Node3D):
	var num_asteroids = randf_range(5, 20)  # Random number of asteroids
	for i in range(int(num_asteroids)):
		var sphere = SphereMesh.new()
		var size = randf_range(10, 50)  # Random size
		sphere.radius = size
		sphere.height = size * 2

		var instance = MeshInstance3D.new()
		instance.mesh = sphere
		instance.transform.origin = Vector3(
			randf_range(-500 + size, 500 - size),
			randf_range(-500 + size, 500 - size),
			randf_range(-500 + size, 500 - size)
		)
		cubie.add_child(instance)

func exit(cubie: Node3D):
	# Remove all asteroid instances when exiting this state
	for child in cubie.get_children():
		if child is MeshInstance3D:
			child.queue_free()
