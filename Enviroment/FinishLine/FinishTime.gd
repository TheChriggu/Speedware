extends Label

export var FinishTime = 0

func _ready():
	text = str(FinishTime)

func _process(delta):
	var FinishTime = get_parent().get_parent().get_parent().get_parent().getFinishTime()
	text = str(FinishTime)