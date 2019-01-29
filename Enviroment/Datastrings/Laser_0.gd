extends Sprite

signal laser_entered
signal laser_exited

#func SwitchToPurple():
#	for laser in get_children():
#		laser.SwitchToPurple()

#func SwitchToOrange():
#		for laser in get_children():
#			laser.SwitchToOrange()

func _on_Area2D_body_entered(body):
	emit_signal("laser_entered")

func _on_Area2D_body_exited(body):
	emit_signal("laser_exited")
