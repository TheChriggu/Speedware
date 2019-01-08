extends Sprite

func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("SpeedboostCollected")
	get_parent().get_node("player/AnimationPlayer").play("speedboost")
