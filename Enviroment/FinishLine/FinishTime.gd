extends Label

var FinishTime = 0
var config = ConfigFile.new()

func _ready():
	text = str(FinishTime)

func _process(delta):
	config.load("user://settings.cfg")
	var FinishTime = int(config.get_value("Time",get_parent().get_parent().get_parent().get_parent().getLevelnumber(),"-"))
	text = str(stepify(FinishTime,0.01))
	#stepify(FinishTime,0.01)
