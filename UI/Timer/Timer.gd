extends CanvasLayer

var CurrentTimer = 0.01

func _ready():
	$TimerLabel.visible = false
	
func _process(delta):
	CurrentTimer+= delta


func PrintCurrentTime():
	return stepify(CurrentTimer, 0.01)

func FinishLinePassed():
	set_process(false)
	SetFinishTime()

func SetFinishTime():
	var FinishTime = CurrentTimer
	return FinishTime

func _on_GameStartTimer_GameStartTimerEnd():
	CurrentTimer = 0
	$TimerLabel.visible = true
