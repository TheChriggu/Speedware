extends Node

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene("res://Levels/Tutorial_Level.tscn")

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("res://Levels/Tutorial_Level.tscn")