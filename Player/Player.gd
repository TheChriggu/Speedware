extends Node

var isInSpeedboost = false #Boolean to track if the player is currently in a speed boost

func _ready():
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
		$ForwardLookingCamera.UpdateCamera($player.position, $player.velocity)

func SwitchColorToOrange():
	pass

func SwitchColorToPurple():
	pass

func SpeedboostStart(speed):
	$player.velocity = speed
	$player.isInSpeedboost = true
	$ForwardLookingCamera.isInSpeedBoost = true
	isInSpeedboost = true

func SpeedboostStop():
	$player.isInSpeedboost = false
	$ForwardLookingCamera.isInSpeedBoost = false
	isInSpeedboost = false

func LaserEntered():
	$player.isSwitchColorEnabled = false

func LaserExited():
	$player.isSwitchColorEnabled = true

func PlayerIsAtFullspeed():
	$BackgroundMusic.isAtFullspeed = true

func PlayerIsNotAtFullspeed():
	$BackgroundMusic.isAtFullspeed = false

func FinishLinePassed():
	$BackgroundMusic.Stop()