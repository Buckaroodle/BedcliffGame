extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -525.0

@export var top: CharacterBody2D
@export var bottomCliffAnimation: AnimatedSprite2D
@export var topBedAnimation: AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if bottomCliffAnimation.is_playing():
			bottomCliffAnimation.stop()
		if topBedAnimation.is_playing():
			topBedAnimation.stop()

	# Handle jump.
	if Input.is_action_just_pressed("bottom_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction < 0: # Flips direction of sprite when moving left
		bottomCliffAnimation.flip_h = true
		topBedAnimation.flip_h = true
	elif direction > 0: # Flips direction of sprite when moving right (and keeps direction when direction is 0)
		bottomCliffAnimation.flip_h = false
		topBedAnimation.flip_h = false
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			bottomCliffAnimation.play("BottomCliffMove")
			topBedAnimation.play("TopBedMove")
	else:
		bottomCliffAnimation.play("BottomCliffIdle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var collision = top.move_and_collide(Vector2(velocity.x * delta,0), true)
	if collision != null and collision.get_collider() != self :
		velocity.x = collision.get_travel().x
	
	move_and_slide()
	
