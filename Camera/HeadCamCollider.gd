extends Node2D

export var FIXED_CAMERA = false
export var CURRENT_ANCHOR = 0
var isZoomedOut = false

func _on_CamCollider_new_camera(anchor, fixed, zoom):
	CURRENT_ANCHOR = anchor
	FIXED_CAMERA = fixed
	isZoomedOut = zoom