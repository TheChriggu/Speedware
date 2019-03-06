extends Particles2D

func Fire():
	emitting = true
	$Timer.start()

#Stop emitting when time runs out, then check, which color needs to be changed
func _on_Timer_timeout():
	emitting = false