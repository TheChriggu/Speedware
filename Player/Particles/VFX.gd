extends Node2D

var isPurple = true
var isEmitting = true

func PlayJumpAnimation():
	#$AnimationPlayer.play("JumpAnimation")
	pass

func TurnBoostParticlesOn():
	$ParticlesIfBoosted.emitting = true
	

func TurnBoostParticlesOff():
	$ParticlesIfBoosted.emitting = false

func TurnTrailOn():
	isEmitting = true
	Emit()

func TurnTrailOff():
	isEmitting = false
	Emit()

func SwitchToOrange():
	isPurple = false
	Emit()

func SwitchToPurple():
	isPurple = true
	Emit()

func Emit():
	if isEmitting:
		if isPurple:
			$Particles2DPurpleZero.emitting = true
			$Particles2DPurpleZero2.emitting = true
			$Particles2DOrangeOne.emitting = false
			$Particles2DOrangeOne2.emitting = false
		else:
			$Particles2DPurpleZero.emitting = false
			$Particles2DPurpleZero2.emitting = false
			$Particles2DOrangeOne.emitting = true
			$Particles2DOrangeOne2.emitting = true
	else:
		$Particles2DPurpleZero.emitting = false
		$Particles2DPurpleZero2.emitting = false
		$Particles2DOrangeOne.emitting = false
		$Particles2DOrangeOne2.emitting = false