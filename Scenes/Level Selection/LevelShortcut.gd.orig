extends Node2D

export(PackedScene) var scene_to_load

func _on_Button_mouse_entered():
	$AnimationPlayer.play("Mouse_Hover")


func _on_Button_mouse_exited():
	$AnimationPlayer.play("Mouse_Hover_Down")


func _on_Button_pressed():
	get_tree().change_scene_to(scene_to_load)


func _on_Button_focus_entered():
	$AnimationPlayer.play("Mouse_Hover")


func _on_Button_focus_exited():
	$AnimationPlayer.play("Mouse_Hover_Down")
