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
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		shoot_projectile( get_local_mouse_position().x, get_local_mouse_position().y)

	move_and_slide()

func shoot_projectile(x,y):
	const BULLET = preload("res://Scenes/projectile.tscn")
	var bullet = BULLET.instantiate()
	get_parent().add_child(bullet)
	bullet.position = Vector2(position.x,position.y)
	#bullet.angular_velocity = 2000
	bullet.add_constant_central_force(Vector2(x,y))
	
