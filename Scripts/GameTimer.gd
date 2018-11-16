extends CanvasLayer

var CurrentTimer = 0.5

func _process(delta):
	CurrentTimer+= delta
	print(CurrentTimer)