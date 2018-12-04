extends Node2D

var previous_speeds = [] #array of the previous 20 player speeds
signal averageSpeed #signal to send once the new average is calculated


func addNew(speed):
	#add new value at the back of the array and remove the first
	previous_speeds.append(speed)
	if (previous_speeds.size() > 20):
		previous_speeds.pop_front()
	
	
	emit_signal("averageSpeed", average())

#function which calculates the average value of the current previous_speeds array
func average():
	var new_speed = Vector2(0,0)
	#sum
	for i in range (previous_speeds.size()):
		new_speed += previous_speeds[i]
	#average
	return(new_speed / previous_speeds.size())
	