extends Node2D

var isRunning =  false
func Run():
	if !isRunning:
		$Base.Run()
		isRunning = true

func SwitchColorToOrange():
	$Base.SwitchColorToOrange()

func SwitchColorToPurple():
	$Base.SwitchColorToPurple()