extends Sprite

signal collected
var isCollected = false

func _on_Area2D_area_entered(area):
	if !isCollected:
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("CollectibleCollected")
		emit_signal("collected")
		isCollected = true