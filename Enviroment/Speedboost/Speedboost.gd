extends Sprite

export var SPEED = 1800

signal speedboost_start
signal speedboost_stop

func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("SpeedboostCollected")
	emit_signal("speedboost_start", Vector2(SPEED, 0).rotated(rotation))


func stop():
	emit_signal("speedboost_stop")