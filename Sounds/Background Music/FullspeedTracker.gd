extends Node2D

var minTimePassed = false
var trackerArray = []
var totalValue = 0

func AddNewEntry(var booleanEntry):
	if booleanEntry:
		totalValue += 1
	else:
		totalValue -= 1
	
	trackerArray.append(booleanEntry)
	
	if minTimePassed:
		if trackerArray[0]:
			totalValue -= 1
		else:
			totalValue += 1
		trackerArray.pop_front()

func _on_Timer2_timeout():
	minTimePassed = true
