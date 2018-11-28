extends KinematicBody2D
#This is the Script for the Character

#Variables
export var GRAVITY = 500.0 #pixels/second/second
const FLOOR_ANGLE_TOLERANCE = 40
#Movementspeed
export var WALK_FORCE = 600
#Minimum Speed to move the Char
export var WALK_MIN_SPEED = 10
#Maximum Speed for the Char
export var WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
export var JUMP_SPEED = 600
#Time the player can jump after leaving an edge (Double click for double jump mechanic~)
export var JUMP_MAX_AIRBORNE_TIME = 0.001


export var SLIDE_STOP_VELOCITY = 9.0 # one pixel/second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # one pixel

var velocity = Vector2()
export var on_air_time = 2
var jumping = false



var prev_jump_pressed = false
export var isGreen = true

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


#Colorswitch Mechanic
func SwitchColor():
	isGreen = not isGreen
	if isGreen:
		$AnimationPlayer.play("SwitchPurpleToOrange")
	else:
		$AnimationPlayer.play("SwitchOrangeToPurple")

#Jump() and jump_cut() are for the "Mario-like"-jump Height controls (MLJ=Mario-like Jump)
func jump():
    velocity.y = -JUMP_SPEED
func jump_cut():
    if velocity.y < -200:
        velocity.y = -200

func _physics_process(delta):
	#basic Player movement
	var force = Vector2(0, GRAVITY)
	var walk_left = Input.is_action_pressed("move_left")
	var walk_right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_pressed("jump")
	#MLJ
	if Input.is_action_just_pressed("jump") && velocity.y < -500:
		velocity.y = -500
		jump()
	#MLJ
	if Input.is_action_just_released("jump"):
		jump_cut()

	var stop = true
	
	if walk_left:
		if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
			force.x -= WALK_FORCE
			stop = false
			
	elif walk_right:
		if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
			force.x += WALK_FORCE
			stop = false
			
	
	if stop:
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		
		velocity.x = vlen * vsign
	
	# Integrate forces to velocity
	velocity += force * delta
	
	
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor():
		on_air_time = 0
		
	if jumping and velocity.y > 0:
		# If falling, no longer jumping
		jumping = false
	
	if on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping:
		#Player can jump, even after leaving the Edge for some time
		velocity.y = -JUMP_SPEED
		jumping = true

	
	on_air_time += delta
	prev_jump_pressed = jump
	#Colorswitch Mechanic
	if Input.is_action_just_pressed("switchColor"):
			SwitchColor()




#Camera calculation
func _process(delta):
	
	#calculate new average speed once every frame
	emit_signal("newSpeed", velocity)
	
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
	emit_signal("newCameraOffsetV", next_offset_v)


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
	emit_signal("newCameraOffsetH", next_offset_h)


#if collider was set to fix the camera to a certain hight
func _on_CamCollider_newFixedCamera(colliderPosition):
	print("newCamAreaEntered")
	vertical_anchor = colliderPosition
	fixedCamera = true

#if collider was set to remove the camera from an anchor
func _on_CamCollider_newFreeCamera():
	print("newCamArea2Entered")
	fixedCamera = false
	pass # replace with function body