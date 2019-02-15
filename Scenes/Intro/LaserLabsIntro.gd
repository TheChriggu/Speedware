extends Panel

func _ready():
	$AnimationPlayer.play("StartupAnimation")
	$AudioStreamPlayer.playing = true


func _on_AnimationPlayer_animation_finished(StartupAnimation):
	get_tree().change_scene("res://Scenes/Level Selection/LevelSelection.tscn")