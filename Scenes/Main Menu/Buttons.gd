extends VBoxContainer

func _on_Start_Game_mouse_entered():
	$AnimationPlayer.play("NewGameMouseHover")

func _on_Start_Game_mouse_exited():
	$AnimationPlayer.play("NewGameMouseHoverDown")

func _on_LevelSelectionButton_mouse_entered():
	$AnimationPlayer.play("LevelSelectionMouseHover")

func _on_LevelSelectionButton_mouse_exited():
	$AnimationPlayer.play("LevelSelectionMouseHoverDown")

func _on_Options_mouse_entered():
	$AnimationPlayer.play("OptionMouseHover")

func _on_Options_mouse_exited():
	$AnimationPlayer.play("OptionMouseHoverDown")

func _on_Chat_Logs_mouse_entered():
	$AnimationPlayer.play("ChatLogsMouseHover")

func _on_Chat_Logs_mouse_exited():
	$AnimationPlayer.play("ChatLogsMouseHoverDown")

func _on_Exit_mouse_entered():
	$AnimationPlayer.play("ExitMouseHover")

func _on_Exit_mouse_exited():
	$AnimationPlayer.play("ExitMouseHoverDown")