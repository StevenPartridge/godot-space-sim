extends CharacterBody3D

@export var max_speed = 50.0
@export var acceleration = 0.6
@export var pitch_speed = 1.5
@export var roll_speed = 1.9
@export var input_response = 8.0

var forward_speed = 0.0
var pitch_input = 0.0
var roll_input = 0.0
var yaw_input = 0.0

func get_input(delta):

	# Temp full speed forward
	forward_speed = lerp(forward_speed, max_speed, acceleration * delta)

	if Input.is_action_pressed("pitch_down"):
		pitch_input = lerp(pitch_input, -1.0, input_response * delta)
	elif Input.is_action_pressed("pitch_up"):
		pitch_input = lerp(pitch_input, 1.0, input_response * delta)
	else:
		pitch_input = lerp(pitch_input, 0.0, input_response * delta)

	if Input.is_action_pressed("roll_right"):
		roll_input = lerp(roll_input, -1.0, input_response * delta)
	elif Input.is_action_pressed("roll_left"):
		roll_input = lerp(roll_input, 1.0, input_response * delta)
	else:
		roll_input = lerp(roll_input, 0.0, input_response * delta)

func _physics_process(delta):
	get_input(delta)
	transform.basis = transform.basis.rotated(transform.basis.z,
			roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x,
			pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.orthonormalized()
	velocity = -transform.basis.z * forward_speed
	move_and_collide(velocity * delta)
