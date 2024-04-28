#extends CharacterBody3D
#
#@export var speed_input: float = 0.2
#
#@export var max_speed = 800.0
#@export var acceleration = 0.6
#@export var pitch_speed = 1.5
#@export var roll_speed = 1.9
#@export var input_response = 0.8
#
#var forward_speed = 0.0
#var pitch_input = 0.0
#var roll_input = 0.0
#var yaw_input = 0.0
#
#func get_input(delta):
#
	## Temp full speed forward
	#if !Input.is_action_pressed("drift"):
		#forward_speed = lerp(forward_speed, max_speed * speed_input, acceleration * delta)
#
	#if Input.is_action_pressed("pitch_down"):
		#pitch_input = lerp(pitch_input, -1.0, input_response * delta)
	#elif Input.is_action_pressed("pitch_up"):
		#pitch_input = lerp(pitch_input, 1.0, input_response * delta)
	#else:
		#pitch_input = lerp(pitch_input, 0.0, input_response * delta)
#
	#if Input.is_action_pressed("roll_right"):
		#roll_input = lerp(roll_input, -1.0, input_response * delta)
	#elif Input.is_action_pressed("roll_left"):
		#roll_input = lerp(roll_input, 1.0, input_response * delta)
	#else:
		#roll_input = lerp(roll_input, 0.0, input_response * delta)
		#
	#if Input.is_action_pressed("turn_right"):
		#yaw_input = lerp(yaw_input, -0.4, input_response * delta)
	#elif Input.is_action_pressed("turn_left"):
		#yaw_input = lerp(yaw_input, 0.4, input_response * delta)
	#else:
		#yaw_input = lerp(yaw_input, 0.0, input_response * delta)
#
#func _physics_process(delta):
	#get_input(delta)
	#transform.basis = transform.basis.rotated(transform.basis.z,
			#roll_input * roll_speed * delta)
	#transform.basis = transform.basis.rotated(transform.basis.x,
			#pitch_input * pitch_speed * delta)
	#transform.basis = transform.basis.rotated(transform.basis.y,
			#yaw_input * roll_speed * delta)
	#transform.basis = transform.basis.orthonormalized()
	#if Input.is_action_pressed("drift"):
		#velocity = velocity
	#else:
		#velocity = -transform.basis.z * forward_speed
	#move_and_collide(velocity * delta)
	
	
extends CharacterBody3D

@export var speed_input: float = 0.2

@export var max_speed = 800.0
@export var acceleration = 0.6
@export var pitch_speed = 1.5
@export var roll_speed = 1.9
@export var input_response = 0.8

var forward_speed = 0.0
var pitch_input = 0.0
var roll_input = 0.0
var yaw_input = 0.0
var target_velocity = Vector3.ZERO

func get_input(delta):
	# Calculate target forward velocity based on current orientation and input
	var forward_dir = -transform.basis.z
	var target_speed = max_speed * speed_input
	if !Input.is_action_pressed("drift"):
		target_velocity = forward_dir * target_speed

	# Pitch, roll, and yaw inputs
	pitch_input = adjust_input("pitch_down", "pitch_up", pitch_input, delta)
	roll_input = adjust_input("roll_right", "roll_left", roll_input, delta)
	yaw_input = adjust_input("turn_right", "turn_left", yaw_input, delta)

func adjust_input(action_decrease, action_increase, current_input, delta):
	var input_value = 0.0
	if Input.is_action_pressed(action_increase):
		input_value = 1.0
	elif Input.is_action_pressed(action_decrease):
		input_value = -1.0
	return lerp(current_input, input_value, input_response * delta)

func _physics_process(delta):
	get_input(delta)

	# Rotate based on input
	transform.basis = transform.basis.rotated(transform.basis.z, roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x, pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.y, yaw_input * roll_speed * delta)
	transform.basis = transform.basis.orthonormalized()

	# Update velocity towards target velocity
	velocity = velocity.lerp(target_velocity, acceleration * delta)

	move_and_collide(velocity * delta)

