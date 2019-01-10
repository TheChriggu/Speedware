extends Node

func _on_player_switched_color_to_orange():
	$Level.SwitchColorToOrange()
	$UI.SwitchColorToOrange()

func _on_player_switched_color_to_purple():
	$Level.SwitchColorToPurple()
	$UI.SwitchColorToPurple()

func _on_Speedboost_speedboost_start(speed):
	$Player.SpeedboostStart(speed)
	$UI.SpeedboostStart()

func _on_Speedboost_speedboost_stop():
	$Player.SpeedboostStop()
	$UI.SpeedboostStop()

func _on_player_is_at_fullspeed():
	$UI.RunFullspeedMode()


func _on_player_is_not_at_fullspeed():
	$UI.StopFullspeedMode()


func _on_Collectible_collected():
	$UI.CollectibleCollected()