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

func CollectibleCollected():
	$CollectiblesCollected.CollectibleCollected()

func FinishLinePassed():
	$Timer.FinishLinePassed()

func MusicBeat():
	$FullspeedMode.MusicBeat()

func Reload():
	$Timer.CurrentTimer = 0
	$CollectiblesCollected.currentCollectibles = 0