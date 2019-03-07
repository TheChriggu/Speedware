extends Node2D

func Reload():
	for collectible in get_children():
		collectible.Reload()