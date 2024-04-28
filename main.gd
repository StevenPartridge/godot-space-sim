extends Node3D

@onready var space_ship = $GridManager/SpaceShip

# Called when the node enters the scene tree for the first time.
func _ready():
	space_ship.global_transform.origin = Vector3(0, 0, 1500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
