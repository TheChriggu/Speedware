extends TextureButton


func _on_Credits_pressed():
	$CreditsWindow.visible = true
	$CreditsWindow/TextureButton.grab_focus()


func _on_TextureButton_pressed():
	$CreditsWindow.visible = false
	get_parent().get_node("LevelShortcuts/LevelShortcut/Button").grab_focus()
