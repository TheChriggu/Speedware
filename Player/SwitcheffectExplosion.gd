extends Node2D



func FireParticles():
	$Particles2D.emitting = true

func StopParticles():
	$Particles2D.emitting = false

func OrangeToPurple():
	$Particles2D.self_modulate = Color ( 242, 1, 179)
func PurpleToOrange():
	$Particles2D.self_modulate = Color (253, 152, 0)