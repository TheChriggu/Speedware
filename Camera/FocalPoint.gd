extends Node2D

var horizontal_distance = 500
var vertical_distance = 200

#set the horizontal camera position
func setHorizontal(offset):
	global_position.x = offset + horizontal_distance

#set the vertical camera position
func setVertical(offset):
	global_position.y  = offset - vertical_distance