extends Node2D

var isRunning =  false
var isJumpingUp = false
var isJumpingDown = false
var isIdle = false
var isVictory = false

signal VictoryAnimationFinished()

func SetAllVariablesToFalse():
	isRunning = false
	isJumpingUp = false
	isJumpingDown = false
	isIdle = false
	isVictory = false
	
func Run(speed):
	if !isRunning:
		$MovementAnimations.play("Run2", 0.1)
		SetAllVariablesToFalse()
		isRunning = true
	else:
		$MovementAnimations.playback_speed = ClampRunningSpeed(speed)

func SwitchColorToOrange():
	$ColorSwitchAnimation.play("SwitchColorToOrange")

func SwitchColorToPurple():
	$ColorSwitchAnimation.play("SwitchColorToPurple")

func JumpUp():
	if !isJumpingUp:
		$MovementAnimations.play("jump_up", 0.3, 1)
		SetAllVariablesToFalse()
		isJumpingUp = true

func JumpDown():
	if !isJumpingDown:
		$MovementAnimations.play("jump-down", 0.3, 1.5)
		SetAllVariablesToFalse()
		isJumpingDown = true

func Idle():
	if !isIdle:
		$MovementAnimations.play("Idle_3", 0.3, 1)
		SetAllVariablesToFalse()
		isIdle = true

func Victory():
	if !isVictory:
		$MovementAnimations.play("VictoryAnimation", 0.3, 1)
		SetAllVariablesToFalse()
		isVictory = true

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
