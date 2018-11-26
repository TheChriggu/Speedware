extends Node2D

var previous_speeds = []
signal averageSpeed

func _on_player_newSpeed(speed):
	#adds a new speed value into the speeds array, removes the oldest value and returns the average of all the values in the array
	#overwrite oldest entry with new one
#	previous_speeds [position_tracker] = current_speed
#	position_tracker += 1
#	position_tracker %= previous_speeds.size()
	previous_speeds.append(speed)
	if (previous_speeds.size() > 20):
		previous_speeds.pop_front()
	
	#calculate average of array
	var new_speed = Vector2(0,0)
	var i = 0
	for i in range (previous_speeds.size()):
		new_speed += previous_speeds[i]
	new_speed /= previous_speeds.size()
	
	emit_signal("averageSpeed", new_speed)