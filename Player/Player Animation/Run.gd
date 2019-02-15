extends Node2D

var isRunning =  false
var isJumpingUp = false
var isJumpingDown = false
var isIdle = false

func SetAllVariablesToFalse():
	isRunning = false
	isJumpingUp = false
	isJumpingDown = false
	isIdle = false
	
func Run(speed):
	if !isRunning:
		$Base.Run(ClampRunningSpeed(speed))
		SetAllVariablesToFalse()
		isRunning = true
	else:
		$Base.SetAnimationSpeed(ClampRunningSpeed(speed))

func SwitchColorToOrange():
	$Base.SwitchColorToOrange()

func SwitchColorToPurple():
	$Base.SwitchColorToPurple()

func JumpUp():
	if !isJumpingUp:
		$Base.JumpUp()
		SetAllVariablesToFalse()
		isJumpingUp = true

func JumpDown():
	if !isJumpingDown:
		$Base.JumpDown()
		SetAllVariablesToFalse()
		isJumpingDown = true

func Idle():
	if !isIdle:
		$Base.Idle()
		SetAllVariablesToFalse()
		isIdle = true

var minSpeed = 0.8
var maxSpeed = 2
func ClampRunningSpeed(speed):
	if speed < minSpeed:
		return minSpeed
	elif speed > maxSpeed:
		return maxSpeed
	return speed