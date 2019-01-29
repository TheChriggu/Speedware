extends Node2D

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")