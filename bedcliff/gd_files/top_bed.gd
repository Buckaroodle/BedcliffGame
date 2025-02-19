extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -525.0
const ADD_VELOCITY_MULT = 0.5

@export var bottom : CharacterBody2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("top_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + bottom.velocity.y * ADD_VELOCITY_MULT
	
	move_and_slide()
	
func _process(delta):
	global_position.x = bottom.global_position.x
