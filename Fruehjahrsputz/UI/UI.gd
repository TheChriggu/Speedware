extends Node

func SwitchColorToOrange():
	$ColorIndicator.SwitchToOrange()

func SwitchColorToPurple():
	$ColorIndicator.SwitchToPurple()

func SpeedboostStart():
	pass

func SpeedboostStop():
	pass

func RunFullspeedMode():
	$FullspeedMode.isInFullspeedMode = true

func StopFullspeedMode():
	$FullspeedMode.isInFullspeedMode = false