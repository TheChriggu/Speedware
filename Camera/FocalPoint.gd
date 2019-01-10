extends Node2D

var horizontalDistance = 500
var verticalDistance = 200

#set the horizontal camera position
func SetHorizontal(offset):
	global_position.x = offset + horizontalDistance

#set the vertical camera position
func SetVertical(offset):
	global_position.y  = offset - verticalDistance