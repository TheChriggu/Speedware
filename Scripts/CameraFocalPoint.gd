extends Node2D


#set the horizontal camera position
func setHorizontal(offset):
	position.x = offset

#set the vertical camera position
func setVertical(offset):
	global_position.y  = offset
