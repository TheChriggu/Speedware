extends KinematicBody2D
#This is the Script for the Character

#Variables
export var GRAVITY = 500.0 # pixels/second/second
const FLOOR_ANGLE_TOLERANCE = 40
export var WALK_FORCE = 600
export var WALK_MIN_SPEED = 10
export var WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
export var JUMP_SPEED = 600
export var JUMP_MAX_AIRBORNE_TIME = 0.2

export var SLIDE_STOP_VELOCITY = 9.0 # one pixel/second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # one pixel

var velocity = Vector2()
#Time the player can jump after leaving an edge (Double click for double jump mechanic~)
export var on_air_time = 6
var jumping = false

var prev_jump_pressed = false
export var isGreen = true

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