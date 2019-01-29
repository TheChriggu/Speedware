extends Node2D

var previousSpeeds = [] #array of the previous 20 player speeds


func AddNew(speed):
	#add new value at the back of the array and remove the first
	previousSpeeds.append(speed)
	if (previousSpeeds.size() > 20):
		previousSpeeds.pop_front()

#function which calculates the average value of the current previous_speeds array
func Average():
	var newSpeed = Vector2(0,0)
	#sum
	for i in range (previousSpeeds.size()):
		newSpeed += previousSpeeds[i]
	#average
	return(newSpeed / previousSpeeds.size())