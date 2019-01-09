extends Node

var player_is_in_speed_boost = false

func _ready():
	$Player.get_node("ForwardLookingCamera").WALK_MAX_SPEED = $Player.get_node("player").WALK_MAX_SPEED

func _physics_process(delta):
	if player_is_in_speed_boost:
		$Player.get_node("ForwardLookingCamera").update_camera_speed_boost($Player.get_node("player").position, $Player.get_node("player").velocity)
	else:
		$Player.get_node("ForwardLookingCamera").update_camera($Player.get_node("player").position, $Player.get_node("player").velocity)

func _on_player_switched_color_to_orange():
	$Level.get_node("Lasers").switch_to_orange()
	$UI.get_node("ColorIndicator").SwitchToOrange()

func _on_player_switched_color_to_purple():
	$Level.get_node("Lasers").switch_to_purple()
	$UI.get_node("ColorIndicator").SwitchToPurple()

func _on_Speedboost_speedboost_start(speed):
	$Player.get_node("player").velocity = speed
	player_is_in_speed_boost = true

func _on_Speedboost_speedboost_stop():
	player_is_in_speed_boost = false

var is_in_fullspeed_mode = false
func _process(delta):
	if $Player.get_node("player").velocity.x >= $Player.get_node("player").WALK_MAX_SPEED - 100 && !is_in_fullspeed_mode:
		$FulspeedMode.get_node("AnimationPlayer").play("Fullspeed Mode")
		is_in_fullspeed_mode = true
	
	if $Player.get_node("player").velocity.x < $Player.get_node("player").WALK_MAX_SPEED - 100 && is_in_fullspeed_mode:
		$FulspeedMode.get_node("AnimationPlayer").stop()
		$FulspeedMode.get_node("AnimationPlayer").play("Fullspeed Mode Stop")
		is_in_fullspeed_mode = false