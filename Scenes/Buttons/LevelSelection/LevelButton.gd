extends Button

export(PackedScene) var level_to_load

func _on_ButtonLevel1_pressed():
	get_tree().change_scene_to(level_to_load)

func _on_ButtonLevel1_mouse_entered():
	$AnimationPlayer.play("Mouse_Hover")


func _on_ButtonLevel1_mouse_exited():
	$AnimationPlayer.play("Mouse_Hover_Down")
