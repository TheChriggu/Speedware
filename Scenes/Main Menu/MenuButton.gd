extends Button

export(PackedScene) var sceneToLoad


func _on_Start_Game_pressed():
	get_tree().change_scene_to(sceneToLoad)
	
