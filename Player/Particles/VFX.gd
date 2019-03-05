extends Node2D

func PlayJumpAnimation():
	#$AnimationPlayer.play("JumpAnimation")
	pass

func TurnBoostParticlesOn():
	$ParticlesIfBoosted.emitting = true
	

func TurnBoostParticlesOff():
	$ParticlesIfBoosted.emitting = false
	