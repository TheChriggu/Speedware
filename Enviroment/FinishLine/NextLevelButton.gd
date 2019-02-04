extends TextureButton

export(PackedScene) var scene_to_load

func _on_NextLevel_pressed():
	get_tree().change_scene_to(scene_to_load)
	get_tree().paused =false

