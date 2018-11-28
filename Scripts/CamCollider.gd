extends Area2D


export var FIXED_CAMERA = true #tracker to check if the collider is supposed to fix camera to a certain hight, or to free it


signal newFixedCamera 
signal newFreeCamera

#if player hits the collider, send a signal for the camera
func _on_CamCollider_body_entered(body):
	if body.get_name() == "player":
		if FIXED_CAMERA:
			emit_signal("newFixedCamera", position.y)
		else:
			emit_signal("newFreeCamera")
	pass
