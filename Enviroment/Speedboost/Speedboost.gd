extends Sprite

export var SPEED = 1800
export var LENGTH = 1.5

signal speedboost_start
signal speedboost_stop

func _ready():
	$Timer.wait_time = LENGTH

func _on_Area2D_area_entered(area):
	$Timer.start()
	emit_signal("speedboost_start", Vector2(SPEED, 0).rotated(rotation))
	$SpeedExplosion.emitting = true

	


func _on_Timer_timeout():
	emit_signal("speedboost_stop")
	$SpeedExplosion.emitting = false
	

	