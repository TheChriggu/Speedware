extends Node2D

func Run():
	$AnimationPlayer.play("Run")

func SwitchColorToOrange():
	$ColorSwitchAnimation.play("SwitchColorToOrange")

func SwitchColorToPurple():
	$ColorSwitchAnimation.play("SwitchColorToPurple")