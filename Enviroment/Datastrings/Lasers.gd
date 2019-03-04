extends Node2D

signal laser_entered
signal laser_exited

var lasersEntered = 0

func SwitchToPurple():
	for laser in get_children():
		laser.SwitchToPurple()

func SwitchToOrange():
		for laser in get_children():
			laser.SwitchToOrange()

func _on_LaserOrange_laser_entered():
	lasersEntered += 1
	if lasersEntered == 1:
		emit_signal("laser_entered")

func _on_LaserOrange_laser_exited():
	lasersEntered -= 1
	if lasersEntered == 0:
		emit_signal("laser_exited")

func _on_LaserBlau_laser_entered():
	lasersEntered += 1
	if lasersEntered == 1:
		emit_signal("laser_entered")

func _on_LaserBlau_laser_exited():
	lasersEntered -= 1
	if lasersEntered == 0:
		emit_signal("laser_exited")