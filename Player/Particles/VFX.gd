extends Node2D

func PlayJumpAnimation():
	#$AnimationPlayer.play("JumpAnimation")
	pass

func TurnBoostParticlesOn():
	$ParticlesIfBoosted.emitting = true
	$ParticlesIfBoosted2.emitting = true

func TurnBoostParticlesOff():
	$ParticlesIfBoosted.emitting = false
	$ParticlesIfBoosted2.emitting = false