extends TextureButton

export(PackedScene) var sceneToLoad


func _on_Start_Game_pressed():
	get_tree().change_scene_to(sceneToLoad)
	


#func _on_Start_Game_focus_entered():
#	$AnimationPlayer.play("ButtonHovered")


#func _on_Start_Game_focus_exited():
#	$AnimationPlayer.play("ButtonNotHovered")
