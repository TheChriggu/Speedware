extends Node2D

var isAtFullspeed = false
var drumsAtFullVolume = false
var bassAtFullVolume = false
var layer2Playing = true
var layer3Locked = false
var waitTimeFinished = false

signal drum_beat

func _ready():
	$Speedware_Layer_2.playing = true
	$Speedware_Layer_2.volume_db = 70
	$Speedware_Basic_Layer_Bass.playing = true
	$Speedware_Basic_Layer_Drums.playing = true
#	$AnimationPlayer.play("OnBeat")

func _process(delta):
	$FullspeedTracker.AddNewEntry(isAtFullspeed)
	
	if isAtFullspeed:
		if !bassAtFullVolume:
			$Speedware_Basic_Layer_Bass.volume_db += 10
			if $Speedware_Basic_Layer_Bass.volume_db >= 60:
				$Speedware_Basic_Layer_Bass.volume_db = 60
				bassAtFullVolume = true
		elif!drumsAtFullVolume:
			$Speedware_Basic_Layer_Drums.volume_db += 5
			if $Speedware_Basic_Layer_Drums.volume_db >= 65:
				$Speedware_Basic_Layer_Drums.volume_db = 65
				drumsAtFullVolume = true
		if layer2Playing && $FullspeedTracker.totalValue > 0:
			var playbackPosition = $Speedware_Layer_2.get_playback_position()
			if LayerChangeSpot(playbackPosition, 0.1):
				$Speedware_Layer_2.stop()
				$Speedware_Layer_3.play(playbackPosition)
				$Speedware_Layer_3.volume_db = 65
				layer2Playing = false
	else:
		if !layer2Playing && $FullspeedTracker.totalValue < 0:
			var playbackPosition = $Speedware_Layer_3.get_playback_position()
			if LayerChangeSpot(playbackPosition, 0.1):
				$Speedware_Layer_3.stop()
				$Speedware_Layer_2.play(playbackPosition)
				$Speedware_Layer_2.volume_db = 70
				layer2Playing = true
		elif $Speedware_Basic_Layer_Drums.volume_db > 0:
			$Speedware_Basic_Layer_Drums.volume_db -= 0.5
			drumsAtFullVolume = false
		elif $Speedware_Basic_Layer_Bass.volume_db > 0:
			$Speedware_Basic_Layer_Bass.volume_db -= 0.5
			bassAtFullVolume = false
			

var spots = [0, 11.852, 23.704]
#5.926, 17.778,

func LayerChangeSpot(var currentPosition, var wiggle):
	for spot in spots:
		if currentPosition < spot+wiggle && currentPosition > spot-wiggle:
			return true
	return false


func Beat():
	emit_signal("drum_beat")


func _on_Wait_timeout():
	waitTimeFinished = true
