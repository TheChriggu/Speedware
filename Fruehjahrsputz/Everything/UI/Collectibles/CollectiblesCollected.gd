extends CanvasLayer

var CurrentCollectibles = 0
export var CollectiblesInThisLevel = 3

func CollectiblesCollected():
	CurrentCollectibles = CurrentCollectibles + 1

func PrintCurrentCollectible():
	return CurrentCollectibles

func CollectiblesInLevel():
	return CollectiblesInThisLevel