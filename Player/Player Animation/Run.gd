extends Node2D

var isRunning =  false
var isJumpingUp = false
var isJumpingDown = false
var isIdle = false
var isVictory = false
var isSpeedBoostRunning = false
var isSpeedBoostJumping = false
var isColliding = false
var isSliding = false

signal VictoryAnimationFinished()

func SetAllVariablesToFalse():
	isRunning = false
	isJumpingUp = false
	isJumpingDown = false
	isIdle = false
	isVictory = false
	isSpeedBoostRunning = false
	isSpeedBoostJumping = false
	isColliding = false
	isSliding = false

func Run(speed):
	if !isRunning:
		$MovementAnimations.play("Run2", 0.1, 1.8)
		SetAllVariablesToFalse()
		isRunning = true
	else:
		$MovementAnimationsBackup.playback_speed = ClampRunningSpeed(speed)

func SwitchColorToOrange():
	$ColorSwitchAnimation.play("SwitchColorToOrange")

func SwitchColorToPurple():
	$ColorSwitchAnimation.play("SwitchColorToPurple")

func JumpUp():
	if !isJumpingUp:
		$MovementAnimations.play("JumpUp", 0.3, 1)
		SetAllVariablesToFalse()
		isJumpingUp = true

func JumpDown():
	if !isJumpingDown:
		$MovementAnimations.play("jump-down", 0.3, 1.5)
		SetAllVariablesToFalse()
		isJumpingDown = true

func Idle():
	if !isIdle:
		$MovementAnimations.play("Idle_2", 0.3, 1)
		SetAllVariablesToFalse()
		isIdle = true

func Victory():
	if !isVictory:
		$MovementAnimations.play("Victory", 0.3, 1)
		SetAllVariablesToFalse()
		isVictory = true

func SpeedBoostRun():
	if !isSpeedBoostRunning:
		$MovementAnimations.play("SpeedBoostRun", 0.3, 1)
		SetAllVariablesToFalse()
		isSpeedBoostRunning = true

func SpeedBoostJumpUp():
	if !isSpeedBoostJumping:
		$MovementAnimations.play("SpeedBoostJumpUp", 0.3, 1)
		SetAllVariablesToFalse()
		isSpeedBoostJumping = true

func Collision():
	if !isColliding:
		$MovementAnimations.play("Collision", 0, 1)
		SetAllVariablesToFalse()
		isColliding = true
		isIdle = true

func Slide():
	if !isSliding:
		$MovementAnimations.play("Slide", 0.3, 1)
		SetAllVariablesToFalse()
		isSliding = true

var minSpeed = 1.8
var maxSpeed = 3
func ClampRunningSpeed(speed):
	if speed < minSpeed:
		return minSpeed
	elif speed > maxSpeed:
		return maxSpeed
	return speed

func AnimationFinished():
	emit_signal("VictoryAnimationFinished")

