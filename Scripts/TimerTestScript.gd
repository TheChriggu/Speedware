extends Label
var CurrentTimer = 0

func _process(delta):
	CurrentTimer+= delta
	print(CurrentTimer)
	Label.text = str(CurrentTimer)
