extends Sprite

func switch_to_purple():
	$AnimationPlayer.play("SwitchOrangeToPurple")

func switch_to_orange():
	$AnimationPlayer.play("SwitchPurpleToOrange")