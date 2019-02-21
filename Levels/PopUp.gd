extends Area2D

var isDisplayingMessage = false
var isInsideArea = false

func _on_PopUp_body_entered(body):
	isInsideArea = true
	$Timer.start()

func _on_Timer_timeout():
	if isInsideArea:
		$CanvasLayer/Label.visible = true
		isDisplayingMessage = true

func _on_PopUp_body_exited(body):
	isInsideArea = false
	if isDisplayingMessage:
		$CanvasLayer/Label.visible = false
		isDisplayingMessage = false
