extends CanvasLayer

signal GameStartTimerEnd

func _on_AnimationPlayer_animation_finished(LevelStartTimer):
	emit_signal("GameStartTimerEnd")