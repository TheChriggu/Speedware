extends CanvasLayer

var CurrentTimer = 0.5

func _process(delta):
	CurrentTimer+= delta


func PrintCurrentTime():
	return stepify(CurrentTimer, 0.01)

func FinishLinePassed():
	set_process(false)
