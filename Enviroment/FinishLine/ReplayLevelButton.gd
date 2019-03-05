extends TextureButton

func _on_ReplayLevel_pressed():
	$ClickSound.playing = true
	get_tree().reload_current_scene()
	get_tree().paused = false
	#get_tree().reload_current_scene()
	#get_tree().paused = false

func _on_ClickSound_finished():
	get_tree().reload_current_scene()
	get_tree().paused = false
