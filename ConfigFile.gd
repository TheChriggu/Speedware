extends Node

var config = ConfigFile.new()
var newScore = 13214564

var Section = "Score"
var key = "Map1"
const Path = "user://settings.cfg"

func _ready():
	
	config.load("user://settings.cfg")
	
	var oldScore = int(config.get_value(Section,key,0))
	
	if newScore > oldScore:
		setScore(newScore)
	
	config.save(Path)

func setScore(value):
	config.set_value(Section,key,value)