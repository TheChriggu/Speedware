extends ColorRect

var isInFullspeedMode = false #Boolean to track if the fulspeed animation should be executed
var isPlayingAnimation = false #Boolean to track if the fullspeed animation is currently playing

func _process(delta):
	if isInFullspeedMode:
		Start()
	if !isInFullspeedMode:
		Stop()

func Start():
	if !isPlayingAnimation:
		$AnimationPlayer.play("FullspeedMode")
		isPlayingAnimation = true

func Stop():
	if isPlayingAnimation:
		$AnimationPlayer.stop()
		$AnimationPlayer.play("StopFullspeedMode")
		isPlayingAnimation = false