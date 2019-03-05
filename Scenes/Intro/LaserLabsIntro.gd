extends Panel

var config = ConfigFile.new()

func _ready():
	$AnimationPlayer.play("StartupAnimation")
	$AudioStreamPlayer.playing = true


func _on_AnimationPlayer_animation_finished(StartupAnimation):
	config.load("user://settings.cfg")
	if not config.has_section_key("Time","00"):
		get_tree().change_scene("res://Levels/Tutorial_Level.tscn")
	else:get_tree().change_scene("res://Scenes/Level Selection/LevelSelection.tscn")