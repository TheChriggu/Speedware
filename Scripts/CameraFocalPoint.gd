extends Node2D


#set the horizontal camera position
func _on_player_newCameraOffsetH(offset):
	position.x = offset

#set the vertical camera position
func _on_player_newCameraOffsetV(offset):
	position.y  = offset
