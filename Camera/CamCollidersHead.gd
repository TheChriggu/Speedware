extends Node2D

signal newFixedCamera
signal newFreeCamera


func _on_Collider1_newCamAreaEntered(newPosition, fixedCamera):
	if fixedCamera:
		emit_signal("newFixedCamera", newPosition)
	else:
		emit_signal("newFreeCamera")
