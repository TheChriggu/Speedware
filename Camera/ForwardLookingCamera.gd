extends Node2D

#Camera Variables
export var MAX_CAM_DISTANCE_H = 500 #how far away the camera can get from the player horizontally
export var MAX_CAM_SPEED_H = 5 #maximal speed of horizontal camera movement
export var MAX_CAM_SPEED_V = 5 #maximal speed of vertical camera movement
var vertical_anchor = 0 #the height offset in regards to the player, to which the camera is anchored
var last_offset = Vector2 (0,0) #previous offset of the camera
var fixedCamera = false #bool to track weather the camera is currently fixed to an anchor or following the players vertical movement

var WALK_MAX_SPEED = 0

#Camera calculation
func update_camera(player_position, velocity):
	$AverageSpeedCalculation.addNew(velocity)
	
	#offset is proportional to current movement speed/max speed
	var next_offset_h = MAX_CAM_DISTANCE_H*$AverageSpeedCalculation.average().x/WALK_MAX_SPEED
	next_offset_h = smoothMovement(next_offset_h, last_offset.x, MAX_CAM_SPEED_H)
	last_offset.x = next_offset_h
	
	#send new offset to camera
	$FocalPoint.setHorizontal(player_position.x + next_offset_h)
	
	#vertical cam offset calculation
	#vertical cam position
	var next_offset_v #vertical offset of the camera
	#set new camera offset, to the anchor if camera is free, otherwise follow the player
	if $HeadCamCollider.FIXED_CAMERA:
		next_offset_v = $HeadCamCollider.CURRENT_ANCHOR #camera offset in relation to the player
	else:
		next_offset_v = player_position.y
		
	next_offset_v = smoothMovement(next_offset_v, last_offset.y, MAX_CAM_SPEED_V)
	last_offset.y = next_offset_v
	
	#send new offset to camera
	$FocalPoint.setVertical(next_offset_v)

func smoothMovement(var next_position, var last_offset, var max_speed):
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (next_position - last_offset) > max_speed: #when moving downwards
		next_position = last_offset + max_speed
	elif (next_position - last_offset) < -max_speed: #when moving upwards
		next_position = last_offset - max_speed
	return next_position