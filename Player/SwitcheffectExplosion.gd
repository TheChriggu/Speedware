extends Node2D

var isCurrentColorPurple = true


#Fire particle in next child. Then increase the tracker
func FireParticles():
	if isCurrentColorPurple:
		$OrangeParticles.FireNext()
	else:
		$PurpleParticles.FireNext()
	
	isCurrentColorPurple = !isCurrentColorPurple


func OrangeToPurple():
	pass

func PurpleToOrange():
	pass