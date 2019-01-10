extends CanvasLayer

var currentCollectibles = 0
export var COLLECTIBLES_IN_THIS_LEVEL = 3

func CollectibleCollected():
	currentCollectibles = currentCollectibles + 1

func PrintCurrentCollectible():
	return currentCollectibles

func CollectiblesInLevel():
	return COLLECTIBLES_IN_THIS_LEVEL