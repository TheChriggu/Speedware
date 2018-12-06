extends Node2D


func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("FinishLine_Passed")
	$LinePassedSoundEffect.playing = true
	get_parent().get_node("BackgroundMusic").playing = false

func _on_LinePassedSoundEffect_finished():
	$LinePassedMusic.playing = true