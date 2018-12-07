extends Node

func _ready():
	$PreSoundMusic.playing = true
	$ForwardLookingCamera.WALK_MAX_SPEED = $player.WALK_MAX_SPEED

func _physics_process(delta):
	$ForwardLookingCamera.update_camera($player.position, $player.velocity)

func _on_player_switched_color_to_orange():
	$Lasers.switch_to_orange()


func _on_player_switched_color_to_purple():
	$Lasers.switch_to_purple()


func _on_PreSoundMusic_finished():
	$BackgroundMusic.playing = true
