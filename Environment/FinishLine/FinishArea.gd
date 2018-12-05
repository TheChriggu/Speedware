extends Node2D



func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("FinishLine_Passed")
	$AudioStreamPlayer2D.playing = true
