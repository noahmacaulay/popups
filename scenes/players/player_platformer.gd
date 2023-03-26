extends CharacterBody2D

# Player variables
@export var speed = 150
@export var jump_power = -400
@export var gravity = 800



# Called every frame. 'delta' is the time since the last frame.
func _physics_process(delta):
	# Get input from the player
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x *= speed

	# Apply gravity
	velocity.y += gravity * delta

	# Jump if the player is on the ground and the jump button is pressed
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_power

	# Move the player
	move_and_slide()

	# Flip the player sprite based on the direction they are facing
	if velocity.x != 0:
		$Sprite.flip_h = velocity.x < 0
