extends Node2D

func SwitchToOrange():
	
	for laser in get_children():
		laser.SwitchToOrange()

func SwitchToPurple():
	
	for laser in get_children():
		laser.SwitchToPurple()