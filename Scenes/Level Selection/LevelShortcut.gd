extends Node2D

export(PackedScene) var scene_to_load
export (String) var LevelNumber = ""


var config = ConfigFile.new()

func _ready():
	config.load("user://settings.cfg")
	var Collectibles = config.get_value("Collectibles", LevelNumber,0)
	var time = config.get_value("Time",LevelNumber,"-")
	$CanvasLayer/BestTime.text = str(time)
	$CanvasLayer/CollectiblesCollected.text = str(Collectibles,"/2")
	$Levelnumber.text = str(LevelNumber)
	if config.has_section_key("Time",LevelNumber):
		$AnimationPlayer.play("ButtonEnabled")
	else:
		$AnimationPlayer.play("ButtonDisabled")

func _on_Button_mouse_entered():
	$AnimationPlayer.play("Mouse_Hover")

func _on_Button_mouse_exited():
	$AnimationPlayer.play("Mouse_Hover_Down")


func _on_Button_pressed():
	$ClickSound.playing = true
	#get_tree().change_scene_to(scene_to_load)

func _on_Button_focus_entered():
	$HoverSound.playing = true
	$AnimationPlayer.play("Mouse_Hover")

func _on_Button_focus_exited():
	$AnimationPlayer.play("Mouse_Hover_Down")


func _on_ClickSound_finished():
	get_tree().change_scene_to(scene_to_load)
