extends Node2D

signal laser_entered
signal laser_exited

#func SwitchToPurple():
#	for laser in get_children():
#		laser.SwitchToPurple()

#func SwitchToOrange():
#		for laser in get_children():
#			laser.SwitchToOrange()

func _on_LaserOrange_laser_entered():
	emit_signal("laser_entered")

func _on_LaserOrange_laser_exited():
	emit_signal("laser_exited")

func _on_LaserBlau_laser_entered():
	emit_signal("laser_entered")

func _on_LaserBlau_laser_exited():
	emit_signal("laser_exited")