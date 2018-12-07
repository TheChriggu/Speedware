extends Node2D

signal finishLinePassed

func _on_Area2D_area_entered(area):
	emit_signal("finishLinePassed")
	$AnimationPlayer.play("FinishLine_Passed")
	$LinePassedSoundEffect.playing = true
	get_parent().get_node("BackgroundMusic").playing = false
	#get_parent().get_node("UI/Timer").

func _on_LinePassedSoundEffect_finished():
	$LinePassedMusic.playing = true