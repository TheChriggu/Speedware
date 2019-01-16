extends Node2D

var currentPlayerSpeed = 100
var playerMaxSpeedReached = true
var drumsAtFullVolume = false
var bassAtFullVolume = false
var drumsSilent

signal drum_beat

func _ready():
	$FourToFloorSynth.playing = true
	$Bass.playing = true
	$Drums.playing = true
	$RythmicPad.playing = true
	$AnimationPlayer.play("OnBeat")

func _process(delta):
	if playerMaxSpeedReached:
		if !bassAtFullVolume:
			$Bass.volume_db += 0.5
			if $Bass.volume_db >= 60:
				bassAtFullVolume = true
		elif!drumsAtFullVolume:
			$Drums.volume_db += 0.5
			if $Drums.volume_db >= 65:
				drumsAtFullVolume = true

	else:
		if $Drums.volume_db > 0:
			$Drums.volume_db -= 0.5
			drumsAtFullVolume = false
		elif $Bass.volume_db > 0:
			$Bass.volume_db -= 0.1
			bassAtFullVolume = false

func Beat():
	emit_signal("drum_beat")
