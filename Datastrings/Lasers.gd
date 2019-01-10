extends Node2D

func SwitchToPurple():
	for laser in get_children():
		laser.switchToPurple()

func SwitchToOrange():
		for laser in get_children():
			laser.SwitchToOrange()