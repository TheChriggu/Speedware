extends Node2D

var currentChild = 0

func FireNext():
	get_children()[currentChild].Fire()
	currentChild += 1
	currentChild %= get_children().size()
