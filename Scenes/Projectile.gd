extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_contact_count()>0):
		var myContacts = get_colliding_bodies()
		for contact in myContacts:
			if(contact.is_in_group("enemy")):
				print("hit")
				contact.get_parent().remove_child(contact)

#func _input(event):
