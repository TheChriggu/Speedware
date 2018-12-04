extends Node

func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
	