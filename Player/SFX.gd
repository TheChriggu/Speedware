extends Node2D

var isMovingOnDatastring = false
var isMovingOnFloor = false
var isPlayingMovingOnDatastringSound = false
var isPlayingMovingOnFloorSound = false

func _process(delta):
	#Stop all wrongly playing sounds
	if isPlayingMovingOnDatastringSound && !isMovingOnDatastring:
		isPlayingMovingOnDatastringSound = false
		$MoveOnDatastring.stop()
	#if isPlayingMovingOnFloorSound && !isMovingOnFloor:
	#	isPlayingMovingOnFloorSound = false
	#	$MoveOnFloor.stop()
	
	#Start all proper sounds, if not yet started
	if isMovingOnDatastring && !isPlayingMovingOnDatastringSound:
		isPlayingMovingOnDatastringSound = true
		$MoveOnDatastring.play()
	#if isMovingOnFloor && !isPlayingMovingOnFloorSound:
	#	isPlayingMovingOnFloorSound = true
	#	$MoveOnFloor.play()
	
	

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

func IncreaseMovementSoundPitch():
	if $MoveOnFloor.pitch_scale < 3.5:
		$MoveOnFloor.pitch_scale += 0.01

func DecreaseMovementSoundPitch():
	if $MoveOnFloor.pitch_scale > 1:
		$MoveOnFloor.pitch_scale -= 0.01