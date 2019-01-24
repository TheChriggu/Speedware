extends Control
#This Script is used to Pause the Game
func _ready():
		 $"Button".grab_focus()
func _input(event):
	if event.is_action_pressed("pause"):
		var newPauseState = not get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState
		$"Button".grab_focus()
