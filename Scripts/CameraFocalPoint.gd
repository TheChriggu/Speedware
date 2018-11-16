extends Node2D

export var MAX_CAM_DISTANCE = 500 #how far away the camera can get from the player
export var MAX_CAM_SPEED = 5 #maximal speed of camera movement
var last_position #previous position of the camera

var previous_speeds = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] #an array which stores the previous 20 velocity values of the player to average them out for smoother cam movement
var position_tracker = 0 #position in the speed array, at which the last speed value was stored

#adds a new speed value into the speeds array, removes the oldest value and returns the average of all the values in the array
func AverageSpeed(var current_speed):
	#overwrite oldest entry with new one
	previous_speeds [position_tracker] = current_speed
	position_tracker += 1
	position_tracker %= previous_speeds.size()
	
	#calculate average of array
	var new_speed = 0
	var i = 0
	for i in previous_speeds.size():
		new_speed += previous_speeds[i]
		i += 1
	new_speed /= previous_speeds.size()
	
	return new_speed

func _ready():
	#initialization
	last_position = position.x
	pass

func _process(delta):
	
	#next camera position is proportional to ratio of current player speed to player max speed
	var parent_h = AverageSpeed(get_parent().velocity.x)
	var parent_h_max = get_parent().WALK_MAX_SPEED	
	var next_position = MAX_CAM_DISTANCE*parent_h/parent_h_max
	
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (next_position-last_position) > MAX_CAM_SPEED: #when moving to the right
		next_position = last_position + MAX_CAM_SPEED
	elif (next_position-last_position) < -MAX_CAM_SPEED: #when moving to the left
		next_position = last_position - MAX_CAM_SPEED
	last_position = next_position
	
	#set the camera
	position = Vector2 (next_position,0)
	pass