extends Node2D

func PlayJumpAnimation():
	#$AnimationPlayer.play("JumpAnimation")
	pass

func TurnBoostParticlesOn():
	$ParticlesIfBoosted.emitting = true
	

func TurnBoostParticlesOff():
	$ParticlesIfBoosted.emitting = false

func TurnTrailOn():
	$Particles2DOrangeOne.visible = true
	$Particles2DOrangeOne2.visible = true
	$Particles2DPurpleZero.visible = true
	$Particles2DPurpleZero2.visible = true

func TurnTrailOff():
	$Particles2DOrangeOne.visible = false
	$Particles2DOrangeOne2.visible = false
	$Particles2DPurpleZero.visible = false
	$Particles2DPurpleZero2.visible = false