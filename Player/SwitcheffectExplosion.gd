extends Node2D



func FireParticles():
	$Particles2D.emitting = true

func StopParticles():
	$Particles2D.emitting = false

func OrangeToPurple():
	$Particles2D.process_material = load("res://Player/Particles/PurpleSwitcheffectExplosion.tres")
func PurpleToOrange():
	$Particles2D.process_material = load("res://Player/Particles/OrangeSwitcheffectExplosion.tres")