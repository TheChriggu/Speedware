extends CanvasLayer


const timeSection = "Time"

var config = ConfigFile.new()




var CurrentTimer = 0.01

func _ready():
	$TimerLabel.visible = false
	
func _process(delta):
	CurrentTimer+= delta


func PrintCurrentTime():
	return stepify(CurrentTimer, 0.01)

func FinishLinePassed():
	set_process(false)
	
	var time = SetFinishTime()
	config.load("user://settings.cfg")
	var previousTime = int(config.get_value(timeSection,$LevelNumber.text,0))
	
	if time < previousTime:
		setTime(time)
	config.save("user://settings.cfg")

func setTime(value):
	config.set_value(timeSection,$LevelNumber.text,value)

func SetFinishTime():
	var FinishTime = CurrentTimer
	return FinishTime

func _on_GameStartTimer_GameStartTimerEnd():
	CurrentTimer = 0
	$TimerLabel.visible = true
