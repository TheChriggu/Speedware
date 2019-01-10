extends Node2D

signal finish_line_passed

func _on_Area2D_area_entered(area):
	emit_signal("finish_line_passed")
	$AnimationPlayer.play("FinishLineassed")
	$LinePassedSoundEffect.playing = true

func _on_LinePassedSoundEffect_finished():
	$LinePassedMusic.playing = true