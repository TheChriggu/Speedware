extends Node2D

var isMovingOnDatastring = false
var isMovingOnFloor = false

func _process(delta):
	#Stop all wrongly playing sounds
	if isMovingOnDatastring && !$HitDetectors.isMovingOnLaser:
		isMovingOnDatastring = false
		$MoveOnDatastring.stop()
	if isMovingOnFloor && !$HitDetectors.isMovingOnFloor:
		isMovingOnFloor = false
		$MoveOnFloor.stop()
	
	#Start all proper sounds, if not yet started
	if $HitDetectors.isMovingOnLaser && !isMovingOnDatastring:
		isMovingOnDatastring = true
		$MoveOnDatastring.play()
	if $HitDetectors.isMovingOnFloor && !isMovingOnFloor:
		isMovingOnFloor = true
		$MoveOnFloor.play()
	
	

func JumpOff():
	$JumpOff.play()

func SwitchColorToOrange():
	$SwitchColorToOrange.play()

func SwitchColorToPurple():
	$SwitchColorToPurple.play()

func HitDatastring():
	$HitDatastring.play()

func MoveThroughDatastring():
	$MoveThroughDatastring.play()