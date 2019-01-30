extends Button

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")

func _on_BackToMenuInfo_toggled(button_pressed):
	get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")


func _on_BackToMenuInfo_pressed():
	get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")
