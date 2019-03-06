extends Node2D
#export(PackedScene) var scene_to_load
export var scene_to_load = "res://Levels/Level1.tscn"
signal finish_line_passed
export var PossibleLevelBestTime = 00.00
export var TwoStarRatingTolerance = 8
export var OneStarRatingTolerance = 15
export var ZeroStarRatingTolerance = 20
var config = ConfigFile.new()
var Levelnumber

func _ready():
	Levelnumber = get_parent().get_parent().get_node("UI/Timer/Levelnumber").text
	print(Levelnumber)

func _on_Area2D_area_entered(area):
	emit_signal("finish_line_passed")
	$LinePassedSoundEffect.playing = true
	getFinishTime()


func getFinishTime():
	var FinishTime = get_parent().get_parent().get_node("UI").get_node("Timer").SetFinishTime()
	return stepify(FinishTime, 0.01)

func _on_NextLevel_pressed():
	get_node("Popup/Control/PopupBackground/NextLevel/ClickSound").playing = true
	get_tree().change_scene(scene_to_load)
	get_tree().paused =false

func _on_player_FinishLineAnimationFinished():
	$AnimationPlayer.play("FinishLinePassed")


func StarRating():
	config.load("user://settings.cfg")
	var PreviousStarRating = config.get_value("StarRating", Levelnumber,0)
	
	var StarRating = 0
	
	if getFinishTime() > PossibleLevelBestTime && getFinishTime() < (PossibleLevelBestTime+TwoStarRatingTolerance):
		$Popup/Control/PopupBackground/AnimationPlayer.play("2StarRating")
		StarRating = 2
		if PreviousStarRating < StarRating:
			setStarRating(StarRating)
		config.save("user://settings.cfg")
		GrabButtonFocus()
		
	elif getFinishTime() > (PossibleLevelBestTime+TwoStarRatingTolerance) && getFinishTime() < (PossibleLevelBestTime+OneStarRatingTolerance):
		$Popup/Control/PopupBackground/AnimationPlayer.play("1StarRating")
		StarRating = 1
		if PreviousStarRating < StarRating:
			setStarRating(StarRating)
		config.save("user://settings.cfg")
		GrabButtonFocus()
		
	elif getFinishTime() > (PossibleLevelBestTime+OneStarRatingTolerance) && getFinishTime() > (PossibleLevelBestTime+ZeroStarRatingTolerance):
		$Popup/Control/PopupBackground/AnimationPlayer.play("0StarRating")
		StarRating = 1
		if PreviousStarRating < StarRating:
			setStarRating(StarRating)
		config.save("user://settings.cfg")
		GrabButtonFocus()
		
	else:
		$Popup/Control/PopupBackground/AnimationPlayer.play("3StarRating")
		StarRating = 3
		if PreviousStarRating < StarRating:
			setStarRating(StarRating)
		config.save("user://settings.cfg")
		GrabButtonFocus()

func GrabButtonFocus():
	$Popup/Control/PopupBackground/NextLevel.grab_focus()


func setStarRating(StarRating):
	config.set_value("StarRating",Levelnumber,StarRating)

func _on_LinePassedSoundEffect_finished():
	#$AnimationPlayer.play("FinishLinePassed")
	pass
