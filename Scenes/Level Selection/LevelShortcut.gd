extends Node2D

export(PackedScene) var scene_to_load
export (String) var LevelNumber = ""

var config = ConfigFile.new()

func _ready():
	config.load("user://settings.cfg")
	var Collectibles = config.get_value("Collectibles", LevelNumber,0)
	var time = config.get_value("Time",LevelNumber,0)
	$BestTime.text = str(time)

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
