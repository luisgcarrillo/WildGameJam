extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("Down"):
		velocity.y += SPEED
	if Input.is_action_pressed("Up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED

	move_and_slide()
