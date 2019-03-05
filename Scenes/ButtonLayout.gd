extends Node

func _input(event):
    if event is InputEventKey:
        if event.pressed:
            get_tree().change_scene("res://Levels/Tutorial_Level.tscn")