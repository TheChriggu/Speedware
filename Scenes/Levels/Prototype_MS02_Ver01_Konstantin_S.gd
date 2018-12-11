extends Node

func _ready():
	$PreSoundMusic.playing = true
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
	$ForwardLookingCamera.update_camera($player.position, $player.velocity)
	if $player.velocity.x >= 0 && $player.velocity.x <= 499 || $player.velocity.x <= 0 && $player.velocity.x >= -499:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -30)
	if $player.velocity.x >= 500 && $player.velocity.x <= 799 || $player.velocity.x <= -500 && $player.velocity.x >= -799:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -20)
	if $player.velocity.x >= 800 && $player.velocity.x <= 1700 || $player.velocity.x <= -800 && $player.velocity.x >= -1700:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -12)
	if $player.velocity.x >= 1800 || $player.velocity.x <= -1800:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), 0)


func _on_player_switched_color_to_orange():
	$Lasers.switch_to_orange()


func _on_player_switched_color_to_purple():
	print ($player.velocity)
	$Lasers.switch_to_purple()


func _on_PreSoundMusic_finished():
	$BackgroundMusic.playing = true
