extends Node2D

signal finish_line_passed

func _on_Area2D_area_entered(area):
	emit_signal("finish_line_passed")
	$AnimationPlayer.play("FinishLinePassed")
	$LinePassedSoundEffect.playing = true
	getFinishTime()

func _on_AnimationPlayer_animation_started(anim_name):
	$Popup/Control/PopupBackground/NextLevel.grab_focus()

func getFinishTime():
	var FinishTime = get_parent().get_parent().get_node("UI").get_node("Timer").SetFinishTime()
	return stepify(FinishTime, 0.01)