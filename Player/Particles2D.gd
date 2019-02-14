extends Particles2D

var mustSwitchColorToPurple = false
var mustSwitchColorToOrange = false

#Stop emitting when time runs out, then check, which color needs to be changed
func _on_Timer_timeout():
	emitting = false
	if mustSwitchColorToPurple:
		OrangeToPurple()
	if mustSwitchColorToOrange:
		PurpleToOrange()

func SetTimerTime(time):
	$Timer.wait_time = time

func StartTimer():
	$Timer.start()

func OrangeToPurple():
	if !emitting:
		process_material = load("res://Player/Particles/PurpleSwitcheffectExplosion2.tres")
		mustSwitchColorToPurple = false
	else:
		mustSwitchColorToPurple = true
		
func PurpleToOrange():
	if !emitting:
		process_material = load("res://Player/Particles/OrangeSwitcheffectExplosion.tres")
		mustSwitchColorToOrange = false
	else:
		mustSwitchColorToOrange = true