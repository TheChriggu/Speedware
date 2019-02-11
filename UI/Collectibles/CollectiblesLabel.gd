extends Label

export var maxCollectibles = 0
var currentCollectibles = 0

func _ready():
	maxCollectibles = get_parent().CollectiblesInLevel()
	text = str(currentCollectibles, "/", maxCollectibles)

func _process(delta):
	var currentCollectibles = get_parent().PrintCurrentCollectible()
	text = str(currentCollectibles, "/", maxCollectibles)
