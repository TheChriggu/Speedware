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
var isMovingOnFloor = false
var isMovingOnDatastring = false

var isControlsEnabled = false
var isFinished = false

func _physics_process(delta):
	CheckFloor()
	
	#during speedboost controls are disabled and friction is not applied
	if not isInSpeedboost:
		BoostTrailOff()
		HorizontalMovement(delta)
	
	else:
		SpeedboostMovement(delta)
		BoostTrailOn()
	
	VerticalMovement(delta)
	UIInteraction()
	MovementTrail()

func HorizontalMovement(delta):
	var force = Vector2(0, GRAVITY) #Vector containing the forces which get applied to the player every frame
	if isControlsEnabled:
		force.x = LeftForce() + RightForce() #calculate horizontal forces
	
	#if forces are applying, play their animtaions, otherwise apply friction
	if force.x > 0:
		LeanRight()
		$SFX.IncreaseMovementSoundPitch()
	elif force.x < 0:
		LeanLeft()
	else:
		ApplyFriction(delta)
	
	# Integrate forces to velocity
	velocity += force *delta
	
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	CheckFullspeed()
	MovementSound()
	#Animations for horizontal movement get called after an on air check in VerticalMovement()
	

func VerticalMovement(delta):
	if isMovingOnFloor || isMovingOnDatastring:
		onAirTime = 0
		if !isFinished:
			OnFloorAnimation()
		else:
			$AnimatedCharacter.Victory()
	else:
		onAirTime += delta
		OnAirAnimation()
	if isControlsEnabled:
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
		$VFX.PlayJumpAnimation()
		$SFX.JumpOff()
		
		velocity.y = -JUMP_SPEED
		isJumping = true
		
	if Input.is_action_just_released("jump") && isJumping && !isInSpeedboost:
		JumpCut()
	
	if isJumping and velocity.y > 0:
		isJumping = false
		$VFX.PlayJumpAnimation()

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
		if velocity.x >= WALK_MAX_SPEED -100:
			$SFX.IncreaseMovementSoundPitch()
	else:
		isAtFullspeed = false
		emit_signal("is_not_at_fullspeed")
	

#ParcticlesIfBoosted
func BoostTrailOn():
	$VFX.TurnBoostParticlesOn()

func BoostTrailOff():
	$VFX.TurnBoostParticlesOff()
	

func _on_GameStartTimer_GameStartTimerEnd():
	isControlsEnabled = true
	#$AnimationPlayer.play("GameStartTimerOver")

func _ready():
	#$AnimationPlayer.play("CharacterGameStartAnimation")
	pass

func _on_FinishArea_finish_line_passed():
	isControlsEnabled = false
	isFinished = true 

func _on_PurpleLaserSidesDetector_area_entered(area):
	if IS_ORANGE:
		$SFX.HitDatastring()
		$AnimatedCharacter.Collision()
		$CollisionEffect/Particles2D.visible = true
	else:
		$SFX.MoveThroughDatastring()

func _on_OrangeLaserSidesDetector_area_entered(area):
	if !IS_ORANGE:
		$SFX.HitDatastring()
		$AnimatedCharacter.Collision()
		$CollisionEffect/Particles2D.visible = true
	else:
		$SFX.MoveThroughDatastring()
		

func _on_PurpleLaserSidesDetector_area_exited(area):
	$CollisionEffect/Particles2D.visible = false


func _on_OrangeLaserSidesDetector_area_exited(area):
	$CollisionEffect/Particles2D.visible = false


func OnAirAnimation():
	if velocity.y < 0:
		if isInSpeedboost:
			$AnimatedCharacter.SpeedBoostJumpUp()
		else:
			$AnimatedCharacter.JumpUp()
	else:
		$AnimatedCharacter.JumpDown()

func OnFloorAnimation():
	if velocity.x != 0:
		if velocity.y > 0:
			$AnimatedCharacter.Slide()
		elif isInSpeedboost:
			$AnimatedCharacter.SpeedBoostRun()
		else:
			$AnimatedCharacter.Run(abs(velocity.x) / WALK_MAX_SPEED)
	else:
		$AnimatedCharacter.Idle()

func CheckFloor():
	isMovingOnFloor = $HitDetectors.isMovingOnFloor
	isMovingOnDatastring = $HitDetectors.isMovingOnLaser
	$SFX.isMovingOnFloor = isMovingOnFloor
	$SFX.isMovingOnDatastring = isMovingOnDatastring

var previousSpeed = 0
func MovementSound():
	if abs(velocity.x) > previousSpeed:
		$SFX.IncreaseMovementSoundPitch()
	elif abs(velocity.x) < previousSpeed || abs(velocity.x) < WALK_MIN_SPEED:
		$SFX.DecreaseMovementSoundPitch()
	
	previousSpeed = velocity.x

func MovementTrail():
	if velocity.x != 0 || velocity.y != 0:
		$VFX.TurnTrailOn()
	else:
		$VFX.TurnTrailOff()

func _on_AnimatedCharacter_VictoryAnimationFinished():
	emit_signal("FinishLineAnimationFinished")


