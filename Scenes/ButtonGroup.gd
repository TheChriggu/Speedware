extends Control

export(PackedScene) var level_to_load

func _on_ButtonLevel1_pressed():
	get_tree().change_scene_to(level_to_load)

func _on_ButtonLevel2_pressed():
	get_tree().change_scene_to(level_to_load)

func _on_ButtonLevel3_pressed():
	get_tree().change_scene_to(level_to_load)

func _on_ButtonLevel4_pressed():
	get_tree().change_scene_to(level_to_load)
