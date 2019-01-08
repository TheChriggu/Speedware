extends Sprite

export var NEW_MAX_SPEED = 1800
export var NEW_MAX_FORCE = 1900
var old_max_speed = 1000
var old_max_force = 1500

signal speedboost_start
signal speedboost_mid
signal speedboost_stop

func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("SpeedboostCollected")

func start():
	emit_signal("speedboost_start", NEW_MAX_SPEED, NEW_MAX_FORCE)

func mid():
	emit_signal("speedboost_mid")

func stop():
	emit_signal("speedboost_stop", old_max_speed, old_max_force)