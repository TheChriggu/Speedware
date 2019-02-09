extends Node2D

var isAtFullspeed = false
var drumsAtFullVolume = false
var bassAtFullVolume = false
var layer2Playing = true
var layer3AtFullVolume = false
var waitTimeFinished = false

signal drum_beat

func _ready():
	$Speedware_Layer_2.playing = true
	$Speedware_Layer_2.volume_db = 70
	$Speedware_Layer_3.playing = true
	$Speedware_Layer_3.volume_db = 0
	$Speedware_Basic_Layer_Bass.playing = true
	$Speedware_Basic_Layer_Drums.playing = true
#	$AnimationPlayer.play("OnBeat")

func _process(delta):
	if isAtFullspeed:
		if !bassAtFullVolume:
			$Speedware_Basic_Layer_Bass.volume_db += 1
			if $Speedware_Basic_Layer_Bass.volume_db >= 60:
				bassAtFullVolume = true
		elif!drumsAtFullVolume:
			$Speedware_Basic_Layer_Drums.volume_db += 0.5
			if $Speedware_Basic_Layer_Drums.volume_db >= 65:
				drumsAtFullVolume = true
				$Wait.start()
		elif layer2Playing && waitTimeFinished:
			$Speedware_Layer_2.volume_db -= 0.5
			$Speedware_Layer_3.volume_db = 65 - $Speedware_Layer_2.volume_db
			if $Speedware_Layer_2.volume_db <= 0:
				layer2Playing = false
				waitTimeFinished = false
	else:
		if !layer2Playing:
			$Speedware_Layer_2.volume_db += 0.5
			$Speedware_Layer_3.volume_db = 65 - $Speedware_Layer_2.volume_db
			if $Speedware_Layer_2.volume_db >= 70:
				layer2Playing = true
				$Wait.start()
		elif $Speedware_Basic_Layer_Drums.volume_db > 0 && waitTimeFinished:
			$Speedware_Basic_Layer_Drums.volume_db -= 0.5
			drumsAtFullVolume = false
		elif $Speedware_Basic_Layer_Bass.volume_db > 0:
			$Speedware_Basic_Layer_Bass.volume_db -= 0.5
			bassAtFullVolume = false
			waitTimeFinished = false
			

func Beat():
	emit_signal("drum_beat")


func _on_Wait_timeout():
	waitTimeFinished = true
