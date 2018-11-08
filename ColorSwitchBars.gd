extends NinePatchRect

export var isGreen = true

func SwitchColor():
	isGreen = not isGreen
	if isGreen:
		$AnimationPlayer.play("SwitchToOrange")
	else:
		$AnimationPlayer.play("SwitchToBlue")

func _physics_process(delta):
		if Input.is_action_just_pressed("switchColor"):
			SwitchColor()