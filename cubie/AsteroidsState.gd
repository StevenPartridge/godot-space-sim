class_name AsteroidsState extends CubieState

var materials = []

func _init():
	var texture_paths = [
		"res://assets/textures/500megapack/coffeestain.jpg",
		"res://assets/textures/500megapack/fuzzygrid.jpg",
		"res://assets/textures/500megapack/hardmicrogrommed.jpg",
		"res://assets/textures/500megapack/rustedspoon.jpg",
		"res://assets/textures/500megapack/specklemarginator.jpg",
		"res://assets/textures/500megapack/staticmoss.jpg"
	]
	for path in texture_paths:
		var texture = load(path)
		var material = StandardMaterial3D.new()
		material.albedo_texture = texture
		materials.append(material)

func enter(cubie: Node3D):
	var num_asteroids = randf_range(5, 20)
	for i in range(int(num_asteroids)):
		var sphere = SphereMesh.new()
		var size = randf_range(10, 50)
		sphere.radius = size
		sphere.height = size * 2

		var instance = MeshInstance3D.new()
		instance.mesh = sphere
		instance.transform.origin = Vector3(
			randf_range(-500 + size, 500 - size),
			randf_range(-500 + size, 500 - size),
			randf_range(-500 + size, 500 - size)
		)

		instance.material_override = materials[randi() % materials.size()]

		cubie.add_child(instance)

func exit(cubie: Node3D):
	for child in cubie.get_children():
		if child is MeshInstance3D:
			child.queue_free()
