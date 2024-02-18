extends CharacterBody2D

@onready var player = get_parent().get_node("Player")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var ACCEL = 10000.0

var health = 1
func _decrement_health(amount:int):
	health = health - amount


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if(test_move(transform,velocity)):
		_decrement_health(1)
		print("Decrement")
		get_parent().remove_child(self)
		

func _physics_process(delta):
	velocity = Vector2()
	
	var player_position = player.global_position
	var target_position = (player_position - position).normalized()
	velocity = velocity.move_toward(target_position * SPEED, ACCEL * delta)
	
	move_and_slide()
		
	look_at(player_position)
