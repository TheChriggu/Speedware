extends Node2D

export var FIXED_CAMERA = false
export var CURRENT_ANCHOR = 0



func _on_CamCollider_newCamera(anchor, fixed):
	CURRENT_ANCHOR = anchor
	FIXED_CAMERA = fixed