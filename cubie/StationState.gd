class_name StationState extends CubieState

func enter(cubie: Node3D):
	var torus = TorusMesh.new()
	torus.inner_radius = 166.00
	torus.outer_radius = 200.00
	torus.rings = 64
	torus.ring_segments = 8
	var instance = MeshInstance3D.new()
	instance.mesh = torus
	instance.transform.origin = Vector3(0, 0, 0)  # Center of the cubie
	cubie.add_child(instance)

func exit(cubie: Node3D):
	for child in cubie.get_children():
		if child is MeshInstance3D:
			child.queue_free()
