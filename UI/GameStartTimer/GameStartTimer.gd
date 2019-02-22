extends CanvasLayer

signal GameStartTimerEnd

func _on_AnimationPlayer_animation_finished(LevelStartTimer):
	emit_signal("GameStartTimerEnd")
	$AnimationPlayer.play("CountdownStarted")
	
func _process(delta):
	if Input.is_action_pressed("jump"):
		$AnimationPlayer.play("LevelStartTimer")