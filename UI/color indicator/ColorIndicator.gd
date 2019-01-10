extends CanvasLayer

func SwitchToPurple():
	$AnimationPlayer.play("SwitchOrangeToPurple")

func SwitchToOrange():
	$AnimationPlayer.play("SwitchPurpleToOrange")
