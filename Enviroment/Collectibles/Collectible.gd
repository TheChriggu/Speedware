extends Sprite

signal collected
var isCollected = false

func _on_Area2D_area_entered(area):
	if !isCollected:
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("CollectibleCollected")
		emit_signal("collected")
		isCollected = true

func _on_Area2D_body_entered(body):
	if !isCollected:
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("CollectibleCollected")
		emit_signal("collected")
		isCollected = true

func Reload():
	isCollected = false
	$AnimationPlayer.play("CollectibleReset")