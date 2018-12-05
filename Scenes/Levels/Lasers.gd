extends Node2D

func switch_to_purple():
	for laser in get_children():
		laser.switch_to_purple()

func switch_to_orange():
		for laser in get_children():
			laser.switch_to_orange()