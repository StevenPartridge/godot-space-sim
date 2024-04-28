extends Node3D

# Dimensions of the grid
var grid_size: Vector3 = Vector3(3, 3, 3) # 3x3x3 grid

# Cubie scene to instance
var cubie_scene: PackedScene = preload("res://cubie/cubie.tscn")

func _ready():
	generate_grid()

func generate_grid():
	for x in range(int(grid_size.x)):
		for y in range(int(grid_size.y)):
			for z in range(int(grid_size.z)):
				var cubie = cubie_scene.instantiate()
				add_child(cubie)
				cubie.global_transform.origin = Vector3(x, y, z) * 2000
				cubie.randomize_content()
