extends Label

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$QuitScreen.visible = true
		$QuitScreen/YesButton.grab_focus()

func _on_NoButton_pressed():
	$QuitScreen.visible = false
	get_parent().get_node("LevelShortcuts/LevelShortcut/Button").grab_focus()


func _on_YesButton_pressed():
	get_tree().quit()
