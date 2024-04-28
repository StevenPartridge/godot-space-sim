extends Control

@export var ship_path: NodePath

@onready var ship = get_node(ship_path)
@onready var speed_slider = $SpeedVBox/SpeedSlider

func _ready():
	speed_slider.value = ship.speed_input

func _on_ship_speed_update(value):
	ship.speed_input = value
	print(value)
