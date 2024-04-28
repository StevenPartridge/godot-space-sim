class_name StationState extends CubieState

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
	var torus = TorusMesh.new()
	torus.inner_radius = 166.00
	torus.outer_radius = 200.00
	torus.rings = 64
	torus.ring_segments = 8
	var instance = MeshInstance3D.new()
	instance.mesh = torus
	instance.transform.origin = Vector3(0, 0, 0)  # Center of the cubie
	cubie.add_child(instance)
	
	instance.material_override = materials[randi() % materials.size()]

func exit(cubie: Node3D):
	for child in cubie.get_children():
		if child is MeshInstance3D:
			child.queue_free()
