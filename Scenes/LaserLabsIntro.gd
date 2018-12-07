extends Panel

func _ready():
	$AnimationPlayer.play("StartupAnimation")


func _on_AnimationPlayer_animation_finished(StartupAnimation):
	get_tree().change_scene("res://Menus/Startmenu/TitleScreen.tscn")


func _on_AnimationPlayer_animation_started(anim_name):
	$AudioStreamPlayer.playing = true
