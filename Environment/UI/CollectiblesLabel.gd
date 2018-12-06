extends Label

export var MaxCollectibles = 0
var CurrentCollectibles = 0

func _ready():
	MaxCollectibles = get_parent().CollectiblesInLevel()
	text = str(CurrentCollectibles, " / ", MaxCollectibles)

func _process(delta):
	var CurrentCollectibles = get_parent().PrintCurrentCollectible()
	text = str(CurrentCollectibles, " / ", MaxCollectibles)
