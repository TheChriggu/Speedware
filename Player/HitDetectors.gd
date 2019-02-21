extends Node2D

var isMovingOnLaser = false
var isMovingOnFloor = false

var laserCounter = 0
var floorCounter = 0

func _on_LaserBottom_area_entered(area):
	laserCounter += 1
	if laserCounter == 1:
		isMovingOnLaser = true

func _on_LaserBottom_area_exited(area):
	laserCounter -= 1
	if laserCounter == 0:
		isMovingOnLaser = false

func _on_FloorBottom_body_entered(body):
	floorCounter += 1
	if floorCounter == 1:
		isMovingOnFloor = true

func _on_FloorBottom_body_exited(body):
	floorCounter -= 1
	if floorCounter == 0:
		isMovingOnFloor = false
