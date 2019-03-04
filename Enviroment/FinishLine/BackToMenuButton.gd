extends TextureButton



func _on_BackToMenu_pressed():
	$ClickSound.playing = true
	#get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")
	#get_tree().paused=false


func _on_ClickSound_finished():
	get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")
	get_tree().paused=false
