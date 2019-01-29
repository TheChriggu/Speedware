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
		$ColorChange.play("FullspeedMode")
		isPlayingAnimation = true

func Stop():
	if isPlayingAnimation:
		$ColorChange.stop()
		isPlayingAnimation = false
		$ColorChange.play("StopFullspeedMode")

var oddBeat = false
func MusicBeat():
	oddBeat = !oddBeat
	if oddBeat && isPlayingAnimation:
		$Visibility.play("MusicBeat")