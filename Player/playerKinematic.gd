extends KinematicBody2D
#This is the Script for the Character

#Variables
export var GRAVITY = 3000.0 #pixels/second/second
#Movementspeed
export var WALK_FORCE = 1500
#Minimum Speed to move the Char
export var WALK_MIN_SPEED = 300
#Maximum Speed for the Char
export var WALK_MAX_SPEED = 1000
export var STOP_FORCE = 1300
export var JUMP_SPEED = 1200
#Time the player can jump after leaving an edge (Double click for double jump mechanic~)
export var JUMP_MAX_AIRBORNE_TIME = 0.001

export var SLIDE_STOP_VELOCITY = 20.0 # one pixel/second
var jump_cut_velocity = 200 #Value used for the jump() and jump_cut() function
var velocity = Vector2()
export var ON_AIR_TIME = 2
var jumping = false

var prev_jump_pressed = false
export var isGreen = true

signal switched_color_to_purple
signal switched_color_to_orange

#Colorswitch Mechanic
func SwitchColor():
	isGreen = not isGreen
	if isGreen:
		$AnimationPlayer.play("SwitchPurpleToOrange")
		$Sprite/TrailEffect/AnimationPlayer.play("ColorSwitch_Purple_to_Yellow")
		$Sprite/TrailEffect/AnimationPlayer.play("NumberSwitch_Number_one")
		$ColorswitchSound.playing = true
		emit_signal("switched_color_to_orange")
	else:
		$AnimationPlayer.play("SwitchOrangeToPurple")
		$Sprite/TrailEffect/AnimationPlayer.play("ColorSwitch_Yellow_to_Purple")
		$Sprite/TrailEffect/AnimationPlayer.play("NumberSwitch_Number_zero")
		$ColorswitchSound.playing = true
		emit_signal("switched_color_to_purple")

#Jump() and jump_cut() are for the "Mario-like"-jump Height controls (MLJ=Mario-like Jump)
func jump():
    velocity.y = -JUMP_SPEED
func jump_cut():
    if velocity.y < -jump_cut_velocity:
        velocity.y = -jump_cut_velocity

func moveRight():
	$AnimationPlayer.play("Move_Right")
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
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
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
	velocity += force *delta
	
	
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor():
		ON_AIR_TIME = 0
		
	if jumping and velocity.y > 0:
		# If falling, no longer jumping
		jumping = false
	
	if ON_AIR_TIME < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping:
		#Player can jump, even after leaving the Edge for some time
		velocity.y = -JUMP_SPEED
		jumping = true

	
	ON_AIR_TIME += delta
	prev_jump_pressed = jump
	#Colorswitch Mechanic
	if Input.is_action_just_pressed("switchColor"):
			SwitchColor()
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()


