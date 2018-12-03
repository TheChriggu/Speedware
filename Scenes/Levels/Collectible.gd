extends Sprite



func _on_StaticBody2D_area_entered(area):
	$AnimationPlayer.play("Dispair")
	
