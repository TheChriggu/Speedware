extends Node

var isInSpeedboost = false #Boolean to track if the player is currently in a speed boost

func _ready():
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
	if isInSpeedboost:
		$ForwardLookingCamera.update_camera_speed_boost($player.position, $player.velocity)
	else:
		$ForwardLookingCamera.update_camera($player.position, $player.velocity)

func SwitchColorToOrange():
	pass

func SwitchColorToPurple():
	pass

func SpeedboostStart(speed):
	$player.velocity = speed
	isInSpeedboost = true

func SpeedboostStop():
	isInSpeedboost = false
