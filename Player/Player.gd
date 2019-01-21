extends Node

var isInSpeedboost = false #Boolean to track if the player is currently in a speed boost

func _ready():
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
	if isInSpeedboost:
		$ForwardLookingCamera.UpdateCameraSpeedBoost($player.position, $player.velocity)
	else:
		$ForwardLookingCamera.UpdateCamera($player.position, $player.velocity)

#func _process(delta):
#	if $player.velocity.x >= $player.WALK_MAX_SPEED:
#		$BackgroundMusic.playerMaxSpeedReached = true
#	else:
#		$BackgroundMusic.playerMaxSpeedReached = false

func SwitchColorToOrange():
	pass

func SwitchColorToPurple():
	pass

func SpeedboostStart(speed):
	$player.velocity = speed
	$player.isInSpeedboost = true
	isInSpeedboost = true

func SpeedboostStop():
	$player.isInSpeedboost = false
	isInSpeedboost = false
