extends Node2D

var isRunning =  false
func Run():
	if !isRunning:
		$Base.Run()
		isRunning = true