extends Area2D

var isDisplayingMessage = false
var isInsideArea = false

func _on_PopUp_body_entered(body):
	isInsideArea = true
	$Timer.start()

func _on_Timer_timeout():
	if isInsideArea:
		$CanvasLayer/Tutorial_Icon.visible = true
		isDisplayingMessage = true

func _on_PopUp_body_exited(body):
	isInsideArea = false
	if isDisplayingMessage:
		$CanvasLayer/Tutorial_Icon.visible = false
		isDisplayingMessage = false
