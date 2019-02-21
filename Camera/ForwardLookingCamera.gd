extends Node2D

#Camera Variables
var CAM_MAX_DISTANCE_H = 150 #how far away the camera can get from the player horizontally
var CAM_MAX_SPEED_H = 15 #maximal speed of horizontal camera movement
var CAM_MAX_SPEED_V = 100 #maximal speed of vertical camera movement
var lastOffset = Vector2 (0,0) #previous offset of the camera
var fixedCamera = false #bool to track whether the camera is currently fixed to an anchor or following the players vertical movement
var isInSpeedBoost = false

var WALK_MAX_SPEED = 0

#Regular camera calculation
func UpdateCamera(playerPosition, velocity):
	$AverageSpeedCalculation.AddNew(velocity)
	
	#offset is proportional to current movement speed/max speed
	var nextOffsetH = SpeedboostFactor()*CAM_MAX_DISTANCE_H*$AverageSpeedCalculation.Average().x/WALK_MAX_SPEED
	nextOffsetH = ClampSpeed(nextOffsetH, lastOffset.x, CAM_MAX_SPEED_H)
	lastOffset.x = nextOffsetH
	
	#send new offset to camera
	$FocalPoint.SetHorizontal(playerPosition.x + nextOffsetH)
	
	#vertical cam offset calculation
	#vertical cam position
	var nextOffsetV #vertical offset of the camera
	#set new camera offset, to the anchor if camera is free, otherwise follow the player
	if $HeadCamCollider.FIXED_CAMERA:
		nextOffsetV = $HeadCamCollider.CURRENT_ANCHOR #camera offset in relation to the player
	else:
		nextOffsetV = playerPosition.y
		
	nextOffsetV = ClampSpeed(nextOffsetV, lastOffset.y, CAM_MAX_SPEED_V)
	lastOffset.y = nextOffsetV
	
	#send new offset to camera
	$FocalPoint.SetVertical(nextOffsetV)

func ClampSpeed(var nextPosition, var lastOffset, var maxSpeed):
	#if camera speed is too high (new position is further away than allowed), set the camera to max speed
	if (nextPosition - lastOffset) > maxSpeed: #when moving downwards
		nextPosition = lastOffset + maxSpeed
	elif (nextPosition - lastOffset) < -maxSpeed: #when moving upwards
		nextPosition = lastOffset - maxSpeed
	return nextPosition

func SpeedboostFactor():
	if isInSpeedBoost:
		return -1
	return 1

func _process(delta):
	Zoom(delta)

var zoomSpeed = 1
var maxZoomDistance = 1.5
var minZoomDistance = 1
var currentZoom = 1
var zoomInSlowdown = 0.5
func Zoom(delta):
	if $HeadCamCollider.isZoomedOut && currentZoom < maxZoomDistance:
		currentZoom += zoomSpeed*delta
	elif !$HeadCamCollider.isZoomedOut && currentZoom > minZoomDistance:
		currentZoom -= zoomSpeed*delta*zoomInSlowdown
	
	$FocalPoint.SetZoomLevel(currentZoom)