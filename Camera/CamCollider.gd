extends Area2D


export var FIXED_CAMERA = false #tracker to check if the collider is supposed to fix camera to a certain hight, or to free it
export var ZOOM_OUT = false #tracker to check if the collider is supposed to let camera zoom out or reset it back to the default zoom level

signal new_camera(anchor, fixed, zoom)

#if player hits the collider, send a signal for the camera
func _on_CamCollider_body_entered(body):
	emit_signal("new_camera", position.y, FIXED_CAMERA, ZOOM_OUT)