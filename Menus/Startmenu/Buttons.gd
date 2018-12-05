extends VBoxContainer

func _on_Start_Game_mouse_entered():
	$AnimationPlayer.play("NewGame_Mouse_Hover")

func _on_Start_Game_mouse_exited():
	$AnimationPlayer.play("NewGame_Mouse_Hover_Down")

func _on_LevelSelectionButton_mouse_entered():
	$AnimationPlayer.play("LevelSelection_Mouse_Hover")


func _on_LevelSelectionButton_mouse_exited():
	$AnimationPlayer.play("LevelSelection_Mouse_Hover_Down")


func _on_Options_mouse_entered():
	$AnimationPlayer.play("Option_Mouse_Hover")


func _on_Options_mouse_exited():
	$AnimationPlayer.play("Option_Mouse_Hover_Down")




func _on_Chat_Logs_mouse_entered():
	$AnimationPlayer.play("ChatLogs_Mouse_Hover")

func _on_Chat_Logs_mouse_exited():
	$AnimationPlayer.play("ChatLogs_Mouse_Hover_Down")


func _on_Exit_mouse_entered():
	$AnimationPlayer.play("Exit_Mouse_Hover")


func _on_Exit_mouse_exited():
	$AnimationPlayer.play("Exit_Mouse_Hover_Down")
