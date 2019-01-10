extends Sprite

func SwitchToPurple():
	$AnimationPlayer.play("SwitchOrangeToPurple")

func SwitchToOrange():
	$AnimationPlayer.play("SwitchPurpleToOrange")