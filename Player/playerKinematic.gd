extends KinematicBody2D

#Variables
export var GRAVITY = 3000.0 #pixels/second/second
export var WALK_FORCE = 1500 #Movement accelleration
export var WALK_MIN_SPEED = 300 #Minimum speed at which the character moves
export var WALK_MAX_SPEED = 1000 #Maximum speed at which to which character speeds up to quickly
export var FULLSPEED_MAX_SPEED = 1500 #Max speed player can reach at all
export var STOP_FORCE = 1300 #Level of friction, which slows the player down
export var JUMP_SPEED = 1200 #Speed to which the players vertical velocity gets set on a jump. Influences jump height
export var JUMP_MAX_AIRBORNE_TIME = 0.001 #Time the player can jump after leaving an edge (Double click for double jump mechanic~)
export var FULSPEED_LEEWAY = 100 #Value around the max walk speed, at which movement is still considered to be full speed
export var FULLSPEED_FORCE = 100 #force at which the character increases his velocity after reaching WALK_MAX_SPEED

var jumpCutVelocity = 200 #vertical speed, which the jump cannot go over
var velocity = Vector2() #Vector containing the horizontal & vertical player speed
export var onAirTime = 0 #Time the player has spent in the air
var isJumping = false #Boolean to track weather or not player is jumping

export var IS_ORANGE = false #Boolean to track, if the player ic currently orange

signal switched_color_to_purple #signal to send if the player has switched his color to orange
signal switched_color_to_orange #signal to send if the player has switched his color to purple
signal is_at_fullspeed #signal to send, if the player is moving at full speed
signal is_not_at_fullspeed #signal to send if player is not at full speed
signal FinishLineAnimationFinished

var isLeaningLeft = false
var isLeaningRight = false

var isInSpeedboost = false
var isAtFullspeed = false

var isSwitchColorEnabled = true

func _physics_process(delta):
	#during speedboost controls are disabled and friction is not applied
	if not isInSpeedboost:
		BoostTrailOff()
		HorizontalMovement(delta)
	
	else:
		SpeedboostMovement(delta)
		BoostTrailOn()
	
	VerticalMovement(delta)
	UIInteraction()

		
func HorizontalMovement(delta):
	var force = Vector2(0, GRAVITY) #Vector containing the forces which get applied to the player every frame
	force.x = LeftForce() + RightForce() #calculate horizontal forces
	
	#if forces are applying, play their animtaions, otherwise apply friction
	if force.x > 0:
		LeanRight()
	elif force.x < 0:
		LeanLeft()
	else:
		ApplyFriction(delta)
	
	# Integrate forces to velocity
	velocity += force *delta
	
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	CheckFullspeed()

func VerticalMovement(delta):
	if is_on_floor():
		onAirTime = 0
	else:
		onAirTime += delta
	
	Jump()

func SpeedboostMovement(delta):
	if velocity.x > 0:
		LeanRight()
	elif velocity.x < 0:
		LeanLeft()
	else:
		isInSpeedboost = false
	
	var force = Vector2(0, GRAVITY)
	# Integrate forces to velocity
	velocity += force *delta
	
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	CheckFullspeed()

func LeftForce():
	if Input.is_action_pressed("move_left"):
		if velocity.x > -WALK_MAX_SPEED:
			return -WALK_FORCE
		elif velocity.x > -FULLSPEED_MAX_SPEED:
			return -FULLSPEED_FORCE
	
	return 0

func RightForce():
	if Input.is_action_pressed("move_right"):
		if velocity.x < WALK_MAX_SPEED:
			return WALK_FORCE
		elif velocity.x < FULLSPEED_MAX_SPEED:
			return FULLSPEED_FORCE
	
	return 0

func ApplyFriction(delta):
	var vsign = sign(velocity.x)
	var vlen = abs(velocity.x)
	vlen -= STOP_FORCE * delta
	if vlen < 0:
		vlen = 0
	
	velocity.x = vlen * vsign

func Jump():
	if Input.is_action_just_pressed("jump") and not isJumping and onAirTime < JUMP_MAX_AIRBORNE_TIME:
		#Player can jump, even after leaving the Edge for some time
		$AnimationPlayer.play("JumpTakeoffAnimation")
		$VFX.play("JumpAnimation")
		$SFX.JumpOff()
		velocity.y = -JUMP_SPEED
		isJumping = true
		
	if Input.is_action_just_released("jump"):
		JumpCut()
	
	if isJumping and velocity.y > 0:
		isJumping = false
		$VFX.play("JumpAnimation")

#Cut the jump, when a certain speed is reached
func JumpCut():
    if velocity.y < -jumpCutVelocity:
        velocity.y = -jumpCutVelocity

func LeanLeft():
	if !isLeaningLeft:
		$AnimationPlayer.play("LeanLeft")
		isLeaningLeft = true
		isLeaningRight = false

func LeanRight():
	if !isLeaningRight:
		$AnimationPlayer.play("LeanRight")
		isLeaningRight = true
		isLeaningLeft = false

func UIInteraction():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("switchColor") && isSwitchColorEnabled:
			SwitchColor()

#Colorswitch Mechanic
func SwitchColor():
	IS_ORANGE = not IS_ORANGE
	if IS_ORANGE:
		$AnimationPlayer.play("SwitchPurpleToOrange")
		$SFX.SwitchColorToOrange()
		emit_signal("switched_color_to_orange")
	else:
		$AnimationPlayer.play("SwitchOrangeToPurple")
		$SFX.SwitchColorToPurple()
		emit_signal("switched_color_to_purple")

func CheckFullspeed():
	if velocity.x >= WALK_MAX_SPEED - FULSPEED_LEEWAY:
		isAtFullspeed = true
		emit_signal("is_at_fullspeed")
	else:
		isAtFullspeed = false
		emit_signal("is_not_at_fullspeed")

#ParcticlesIfBoosted
func BoostTrailOn():
	$Sprite/ParticlesIfBoosted.emitting = true

func BoostTrailOff():
	$Sprite/ParticlesIfBoosted.emitting = false
	

func _on_GameStartTimer_GameStartTimerEnd():
	$AnimationPlayer.play("GameStartTimerOver")

func _ready():
	$AnimationPlayer.play("CharacterGameStartAnimation")


func _on_FinishArea_finish_line_passed():
	$AnimationPlayer.play("FinishLinePassedCharFreeze")
	emit_signal("FinishLineAnimationFinished")
