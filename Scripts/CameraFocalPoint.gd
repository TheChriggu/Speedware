extends Node2D

func _ready():
	position = Vector2(0,0)

#set the camera
func _on_player_newCameraOffsetH(offset):
	position.x = offset


func _on_player_newCameraOffsetV(offset):
	position.y  = offset
