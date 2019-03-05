extends Node2D

export(PackedScene) var scene_to_load
export (String) var LevelNumber = ""


var config = ConfigFile.new()

func _ready():
	$Button.disabled = true
	config.load("user://settings.cfg")
	var Collectibles = config.get_value("Collectibles", LevelNumber,0)
	var time = config.get_value("Time",LevelNumber,"-")
	var StarRating = config.get_value("StarRating",LevelNumber,0)
	$CanvasLayer/BestTime.text = str(time)
	$CanvasLayer/CollectiblesCollected.text = str(Collectibles,"/2")
	$Levelnumber.text = str(LevelNumber)
	EnabledCheck()
	
	if StarRating == 0:
		$AnimationPlayer.play("StarRating0")
	elif StarRating == 1:
		$AnimationPlayer.play("StarRating1")
	elif StarRating == 2:
		$AnimationPlayer.play("StarRating2")
	elif StarRating == 3:
		$AnimationPlayer.play("StarRating3")

func _on_Button_mouse_entered():
	$AnimationPlayer.play("Mouse_Hover")
	
func EnabledCheck():
	var PreLevelNumber = int(LevelNumber)-1
	var PreLevelNumberConv = str(PreLevelNumber).pad_zeros(2)
	if int(LevelNumber) > 0:
		if config.has_section_key("Time",PreLevelNumberConv):
			$Button.disabled = false
			print("enabled ", LevelNumber)
		if not config.has_section_key("Time",PreLevelNumberConv):
			print("disabled ", LevelNumber)
	else: $Button.disabled = false
		
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
