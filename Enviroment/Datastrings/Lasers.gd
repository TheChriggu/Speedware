extends Node2D

func SwitchToPurple():
	for laser in get_children():
		laser.SwitchToPurple()

func SwitchToOrange():
		for laser in get_children():
			laser.SwitchToOrange()