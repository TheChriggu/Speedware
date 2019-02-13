extends Node2D
export(PackedScene) var scene_to_load
signal finish_line_passed
export var PossibleLevelBestTime = 00.00
export var TwoStarRatingTolerance = 8
export var OneStarRatingTolerance = 15
export var ZeroStarRatingTolerance = 20

func _on_Area2D_area_entered(area):
	emit_signal("finish_line_passed")
	$LinePassedSoundEffect.playing = true
	getFinishTime()


func getFinishTime():
	var FinishTime = get_parent().get_parent().get_node("UI").get_node("Timer").SetFinishTime()
	return stepify(FinishTime, 0.01)

func _on_NextLevel_pressed():
	get_tree().change_scene_to(scene_to_load)
	get_tree().paused =false

func _on_player_FinishLineAnimationFinished():
	$AnimationPlayer.play("FinishLinePassed")

	if getFinishTime() > PossibleLevelBestTime && getFinishTime() < (PossibleLevelBestTime+TwoStarRatingTolerance):
		$Popup/Control/PopupBackground/AnimationPlayer.play("2StarRating")
	elif getFinishTime() > (PossibleLevelBestTime+TwoStarRatingTolerance) && getFinishTime() < (PossibleLevelBestTime+OneStarRatingTolerance):
		$Popup/Control/PopupBackground/AnimationPlayer.play("1StarRating")
	elif getFinishTime() > (PossibleLevelBestTime+OneStarRatingTolerance) && getFinishTime() > (PossibleLevelBestTime+ZeroStarRatingTolerance):
		$Popup/Control/PopupBackground/AnimationPlayer.play("0StarRating")
	else:
		$Popup/Control/PopupBackground/AnimationPlayer.play("3StarRating")



func GrabButtonFocus():
	$Popup/Control/PopupBackground/NextLevel.grab_focus()