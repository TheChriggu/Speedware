extends Panel

var config = ConfigFile.new()

func _ready():
	$AnimationPlayer.play("StartupAnimation")
	$AudioStreamPlayer.playing = true
	config.load("user://settings.cfg")

#func _on_AnimationPlayer_animation_finished(StartupAnimation):
#	if not config.has_section_key("Time","00"):
#		get_tree().change_scene("res://Scenes/ButtonLayout.tscn")
#	else:get_tree().change_scene("res://Scenes/Level Selection/LevelSelection.tscn")

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if not config.has_section_key("Time","00"):
			get_tree().change_scene("res://Scenes/ButtonLayout.tscn")
		else:get_tree().change_scene("res://Scenes/Level Selection/LevelSelection.tscn")
		
	elif Input.is_action_just_pressed("jump"):
		if not config.has_section_key("Time","00"):
			get_tree().change_scene("res://Scenes/ButtonLayout.tscn")
		else:get_tree().change_scene("res://Scenes/Level Selection/LevelSelection.tscn")