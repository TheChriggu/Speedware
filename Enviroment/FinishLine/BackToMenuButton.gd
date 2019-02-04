extends TextureButton



func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")
	get_tree().paused=false
