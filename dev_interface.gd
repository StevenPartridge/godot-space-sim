extends Control

@export var ship_path: NodePath
@onready var max_speed_value = $VBoxContainer/max_speed/MaxSpeedValue
@onready var acceleration_value = $VBoxContainer/acceleration/AccelerationValue
@onready var pitch_speed_value = $VBoxContainer/pitch_speed/PitchSpeedValue
@onready var roll_speed_value = $VBoxContainer/roll_speed/RollSpeedValue
@onready var input_response_value = $VBoxContainer/input_response/InputResponseValue
@onready var drift_transition_value = $VBoxContainer/drift_transition/DriftTransitionValue

@onready var ship = get_node(ship_path)

func _ready():
	max_speed_value.text = str(ship.max_speed)
	acceleration_value.text = str(ship.acceleration)
	pitch_speed_value.text = str(ship.pitch_speed)
	roll_speed_value.text = str(ship.roll_speed)
	input_response_value.text = str(ship.input_response)
	drift_transition_value.text = str(ship.drift_transition)

# Assuming each slider's `value_changed` signal is connected to these methods
func _on_MaxSpeedSlider_value_changed(value):
	ship.max_speed = value
	max_speed_value.text = str(value)
	
func _on_drift_transition_value_changed(value):
	ship.drift_transition = value
	drift_transition_value.text = str(value)

func _on_AccelerationSlider_value_changed(value):
	ship.acceleration = value
	acceleration_value.text = str(value)

func _on_PitchSpeedSlider_value_changed(value):
	ship.pitch_speed = value
	pitch_speed_value.text = str(value)

func _on_RollSpeedSlider_value_changed(value):
	ship.roll_speed = value
	roll_speed_value.text = str(value)

func _on_InputResponseSlider_value_changed(value):
	ship.input_response = value
	input_response_value.text = str(value)
