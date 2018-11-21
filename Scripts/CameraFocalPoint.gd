extends Node2D

export var MAX_CAM_DISTANCE_H = 500 #how far away the camera can get from the player horizontally
export var MAX_CAM_SPEED = 5 #maximal speed of camera movement
export var BUMP_SIZE = 0.05 #how far the camera should bump
var last_position = Vector2 (0,0) #previous position of the camera
var bumpDown = false #boolean to track if camera bump has been started
var bumpGoal = 0 #where the camera is currently moving


#var previous_speeds = [Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0)] #an array which stores the previous 20 velocity values of the player to average them out for smoother cam movement
var previous_speeds = []
var position_tracker = 0 #position in the speed array, at which the last speed value was stored

#adds a new speed value into the speeds array, removes the oldest value and returns the average of all the values in the array
func AverageSpeed(var current_speed):
	#overwrite oldest entry with new one
#	previous_speeds [position_tracker] = current_speed
#	position_tracker += 1
#	position_tracker %= previous_speeds.size()
	previous_speeds.append(current_speed)
	if (previous_speeds.size() > 20):
		previous_speeds.pop_front()
	
	#calculate average of array
	var new_speed = Vector2(0,0)
	var i = 0
	for i in previous_speeds.size():
		new_speed += previous_speeds[i]
		i += 1
	new_speed /= previous_speeds.size()
	
	return new_speed

func _ready():
	#initialization
	last_position = position
	pass

func _process(delta):
	
	#next camera position is proportional to ratio of current player speed to player max speed
	var parent_speed = AverageSpeed(get_parent().velocity)
	var parent_h_max = get_parent().WALK_MAX_SPEED
	var next_position_h = MAX_CAM_DISTANCE_H*parent_speed.x/parent_h_max
	
	
	
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (next_position_h - last_position.x) > MAX_CAM_SPEED: #when moving to the right
		next_position_h = last_position.x + MAX_CAM_SPEED
	elif (next_position_h - last_position.x) < -MAX_CAM_SPEED: #when moving to the left
		next_position_h = last_position.x - MAX_CAM_SPEED
	last_position.x = next_position_h
	
	
	
	#the Bump!
	#if lowest point of bump is reached, reset
	if bumpDown and sqrt(pow(position.y - bumpGoal,2)) < 1:
		bumpDown = false
		bumpGoal = 0
	
	#start camera bump upon landing
	if !bumpDown and parent_speed.y != 0 and get_parent().velocity.y == 0:
		bumpDown = true
		bumpGoal = BUMP_SIZE * parent_speed.y #bump size rises with larger falling speed
	
	
	var next_position_v = bumpGoal
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (next_position_v - last_position.y) > MAX_CAM_SPEED: 
		next_position_v = last_position.y + MAX_CAM_SPEED
	elif (next_position_v - last_position.y) < -MAX_CAM_SPEED:
		next_position_v = last_position.y - MAX_CAM_SPEED
	last_position.y = next_position_v
	

	
	#set the camera
	position = Vector2 (next_position_h,0)
	pass