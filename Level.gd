extends Node

func _ready():
	##TODO: Set old max speed and old max force in Speedbooster
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
	$ForwardLookingCamera.update_camera($player.position, $player.velocity)

func _on_player_switched_color_to_orange():
	$Lasers.switch_to_orange()


func _on_player_switched_color_to_purple():
	$Lasers.switch_to_purple()


func _on_Speedboost_speedboost_start(new_max_speed, new_max_force):
	$player.WALK_MAX_SPEED = new_max_speed
	$player.WALK_FORCE = new_max_force




func _on_Speedboost_speedboost_mid():
	##TODO: return Camera
	pass # replace with function body


func _on_Speedboost_speedboost_stop(new_max_speed, new_max_force):
	$player.WALK_MAX_SPEED = new_max_speed
	$player.WALK_FORCE = new_max_force