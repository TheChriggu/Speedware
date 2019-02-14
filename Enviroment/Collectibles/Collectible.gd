extends Sprite

signal collected

func _on_Area2D_area_entered(area):
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("CollectibleCollected")
	emit_signal("collected")