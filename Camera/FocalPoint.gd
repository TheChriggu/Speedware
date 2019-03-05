extends Node2D

export var HORIZONTAL_OFFSET = 700
export var VERTICAL_OFFSET = 150

#set the horizontal camera position
func SetHorizontal(offset):
	global_position.x = offset + HORIZONTAL_OFFSET

#set the vertical camera position
func SetVertical(offset):
	global_position.y  = offset - VERTICAL_OFFSET

func SetZoomLevel(level):
	$Camera2D.zoom = Vector2(level, level)