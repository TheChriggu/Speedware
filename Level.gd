extends Node

var player_is_in_speed_boost = false

func _ready():
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
	if player_is_in_speed_boost:
		$ForwardLookingCamera.update_camera_speed_boost($player.position, $player.velocity)
	else:
		$ForwardLookingCamera.update_camera($player.position, $player.velocity)

func _on_player_switched_color_to_orange():
	$Lasers.switch_to_orange()

func _on_player_switched_color_to_purple():
	$Lasers.switch_to_purple()

func _on_Speedboost_speedboost_start(speed):
	$player.velocity = speed
	player_is_in_speed_boost = true

func _on_Speedboost_speedboost_stop():
	player_is_in_speed_boost = false

var is_in_fullspeed_mode = false
#func _process(delta):
#	if $player.velocity.x >= $player.WALK_MAX_SPEED - 100 && !is_in_fullspeed_mode:
#		$AnimationPlayer.play("Fullspeed Mode")
#		is_in_fullspeed_mode = true
	
#	if $player.velocity.x < $player.WALK_MAX_SPEED - 100 && is_in_fullspeed_mode:
#		$AnimationPlayer.stop()
#		$AnimationPlayer.play("Fullspeed Mode Stop")
#		is_in_fullspeed_mode = false