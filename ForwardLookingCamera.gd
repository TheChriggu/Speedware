extends Node2D

#Camera Variables
export var MAX_CAM_DISTANCE_H = 500 #how far away the camera can get from the player horizontally
export var MAX_CAM_SPEED_H = 5 #maximal speed of horizontal camera movement
export var MAX_CAM_SPEED_V = 5 #maximal speed of vertical camera movement
var vertical_anchor = 0 #the height offset in regards to the player, to which the camera is anchored
var last_offset = Vector2 (0,0) #previous offset of the camera
signal newCameraOffsetH #emit once a new horizontal camera offset has been calculated
signal newCameraOffsetV #emit once a new vertical camera offset has been calculated
signal newSpeed #emit once every frame to calculate the speed for the camera
var fixedCamera = false #bool to track weather the camera is currently fixed to an anchor or following the players vertical movement



#Camera calculation
func _process(delta):
	#calculate new average speed once every frame. Initializes horizontal camera offset calculation
	$AverageSpeedCalculator.addNew(velocity)
	
	#vertical cam offset calculation
	#vertical cam position
	var next_offset_v #vertical offset of the camera
	
	#set new camera offset, to the anchor if camera is free, otherwise follow the player
	if fixedCamera:
		next_offset_v = vertical_anchor-position.y #camera offset in relation to the player
	else:
		next_offset_v = 0
		
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (next_offset_v - last_offset.y) > MAX_CAM_SPEED_V: #when moving downwards
		next_offset_v = last_offset.y + MAX_CAM_SPEED_V
	elif (next_offset_v - last_offset.y) < -MAX_CAM_SPEED_V: #when moving upwards
		next_offset_v = last_offset.y - MAX_CAM_SPEED_V
	last_offset.y = next_offset_v
	
	#send new offset to camera
	$CameraFocalPoint.setVertical(next_offset_v)


#horizontal cam position, dependant on the players speed
#once the average of the past speeds has been calculated, calculate the new camera offset
func _on_AverageSpeedCalculator_averageSpeed(speed):
	#offset is proportional to current movement speed/max speed
	var next_offset_h = MAX_CAM_DISTANCE_H*speed.x/WALK_MAX_SPEED
	
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (next_offset_h - last_offset.x) > MAX_CAM_SPEED_H: #when moving to the right
		next_offset_h = last_offset.x + MAX_CAM_SPEED_H
	elif (next_offset_h - last_offset.x) < -MAX_CAM_SPEED_H: #when moving to the left
		next_offset_h = last_offset.x - MAX_CAM_SPEED_H
	last_offset.x = next_offset_h
	
	
	#send new offset to camera
	$CameraFocalPoint.setHorizontal(next_offset_h)


#if collider was set to fix the camera to a certain hight
func _on_CamCollider_newFixedCamera(colliderPosition):
	vertical_anchor = colliderPosition
	fixedCamera = true

#if collider was set to remove the camera from an anchor
func _on_CamCollider_newFreeCamera():
	fixedCamera = false
	pass # replace with function body