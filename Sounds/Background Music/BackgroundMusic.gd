extends Node2D

var isAtFullspeed = true
var drumsAtFullVolume = false
var drumsSilent = true
var layer2AtFullVolume = false
var layer2Silent = true
var layer3AtFullVolume = false
var waitTimeFinished = false

signal drum_beat

func _ready():
	$Speedware_Layer1.playing = true
	$Speedware_Layer1.volume_db = 70
	$Speedware_Layer2.playing = true
	$Speedware_Layer2.volume_db = 0
	$Speedware_Layer3.playing = false
	$Speedware_Layer3.volume_db = 70
	$Speedware_Layer2and3_Percussion.playing = true
	$Speedware_Layer2and3_Percussion.volume_db = 0
#	$AnimationPlayer.play("OnBeat")
	pass

func DebugChangeFullspeed():
	if Input.is_action_just_pressed("jump"):
		isAtFullspeed = !isAtFullspeed

func _process(delta):
	
	DebugChangeFullspeed()
	
	$FullspeedTracker.AddNewEntry(isAtFullspeed)
	
	if isAtFullspeed:
		if !drumsAtFullVolume:
			drumsAtFullVolume = IncreaseVolume($Speedware_Layer2and3_Percussion, 60, 5)
			drumsSilent = false
		
		if !layer2AtFullVolume:
			layer2AtFullVolume = IncreaseVolume($Speedware_Layer2, 70, 0.5)
			layer2Silent = false
			
		elif !layer3AtFullVolume:
			var playbackPosition = $Speedware_Layer2.get_playback_position()
			if LayerChangeSpot(playbackPosition, 0.1):
				$Speedware_Layer2.stop()
				$Speedware_Layer3.play(playbackPosition)
				$Speedware_Layer3.volume_db = 70
				layer3AtFullVolume = true
	
			#layer3AtFullVolume = IncreaseVolume($Speedware_Layer3, 70, 0.5)
			#DecreaseVolume($Speedware_Layer2, 0, 0.1)
			#layer3Silent = false
		#if !drumsAtFullVolume:
		#	drumsAtFullVolume = IncreaseVolume($Speedware_Layer2and3_Percussion, 60, 5)
		#	drumsSilent = false
	
	else:
		if layer3AtFullVolume && $FullspeedTracker.totalValue < 0:
			var playbackPosition = $Speedware_Layer3.get_playback_position()
			if LayerChangeSpot(playbackPosition, 0.1):
				$Speedware_Layer3.stop()
				$Speedware_Layer2.play(playbackPosition)
				$Speedware_Layer2.volume_db = 70
				layer3AtFullVolume = false
		elif !layer2Silent:
			layer2Silent = DecreaseVolume($Speedware_Layer2, 0, 0.1)
			layer2AtFullVolume = false
		if !drumsSilent:
			drumsSilent = DecreaseVolume($Speedware_Layer2and3_Percussion, 0, 0.1)
			drumsAtFullVolume = false

var spots = [0, 12, 24]
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

func IncreaseVolume(audioPlayer, finalVolume, stepSize):
	if audioPlayer.volume_db >= finalVolume:
		return true
	
	audioPlayer.volume_db += abs(stepSize) #only increase volume. expect people to input negative values
	return false

func DecreaseVolume(audioPlayer, finalVolume, stepSize):
	if audioPlayer.volume_db <= finalVolume:
		return true
	
	audioPlayer.volume_db -= abs(stepSize) #only decrease the volume. Expect stupid people to input negative values here
	return false
