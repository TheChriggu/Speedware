extends Area2D


export var FIXED_CAMERA = true #tracker to check if the collider is supposed to fix camera to a certain hight, or to free it


signal newCamera(anchor, fixed)

#if player hits the collider, send a signal for the camera
func _on_CamCollider_body_entered(body):
	emit_signal("newCamera", position.y, FIXED_CAMERA)