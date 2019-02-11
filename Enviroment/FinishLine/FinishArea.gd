extends Node2D
export(PackedScene) var scene_to_load
signal finish_line_passed

func _on_Area2D_area_entered(area):
	emit_signal("finish_line_passed")
	$LinePassedSoundEffect.playing = true
	getFinishTime()

#func _on_AnimationPlayer_animation_started(anim_name):
#	$Popup/Control/PopupBackground/NextLevel.grab_focus()

func getFinishTime():
	var FinishTime = get_parent().get_parent().get_node("UI").get_node("Timer").SetFinishTime()
	return stepify(FinishTime, 0.01)

func _on_NextLevel_pressed():
	get_tree().change_scene_to(scene_to_load)
	get_tree().paused =false

func _on_player_FinishLineAnimationFinished():
	$AnimationPlayer.play("FinishLinePassed")

func GrabButtonFocus():
	$Popup/Control/PopupBackground/NextLevel.grab_focus()