extends TextureButton

func _on_ReplayLevel_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false