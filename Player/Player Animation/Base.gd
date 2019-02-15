extends Node2D

func Run(speed):
	$MovementAnimations.play("Run", 0.1)

func SwitchColorToOrange():
	$ColorSwitchAnimation.play("SwitchColorToOrange")

func SwitchColorToPurple():
	$ColorSwitchAnimation.play("SwitchColorToPurple")

func Idle():
	$MovementAnimations.play("Idle", 0.3, 1)

func JumpUp():
	$MovementAnimations.play("jump_up", 0.3, 1)

func JumpDown():
	$MovementAnimations.play("jump-down", 0.1, 1.5)

func SetAnimationSpeed(speed):
	$MovementAnimations.playback_speed = speed
	print("setanimationspeed to ", speed)
	print("current animation speed = ", $MovementAnimations.playback_speed)