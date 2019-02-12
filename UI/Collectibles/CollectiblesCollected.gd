extends CanvasLayer

var currentCollectibles = 0
export var COLLECTIBLES_IN_THIS_LEVEL = 3

const collectiblesSection = "Collectibles"
var config = ConfigFile.new()
var Levelnumber = get_parent().get_node("UI/Timer/Levelnumber").text

func CollectibleCollected():
	currentCollectibles = currentCollectibles + 1

func PrintCurrentCollectible():
	return currentCollectibles

func CollectiblesInLevel():
	return COLLECTIBLES_IN_THIS_LEVEL

func _on_FinishArea_finish_line_passed():
	var Collectibles = currentCollectibles
	config.load("user://settings.cfg")
	var previousCollectiblesCollected = int(config.get_value(collectiblesSection,Levelnumber,0))
	
	if Collectibles > previousCollectiblesCollected:
		setCollectiblesScore(Collectibles)
	
	config.save("user://settings.cfg")

func setCollectiblesScore(value):
	config.set_value(collectiblesSection,get_parent().get_parent().get_node("UI/Timer/Levelnumber").text,value)