extends Area2D

var isDisplayingMessage = false
var isInsideArea = false
export var isFirstPopUp = false

func _on_PopUp_body_entered(body):
	if !isFirstPopUp:
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


func _on_GameStartTimer_GameStartTimerEnd():
	if isFirstPopUp:
		isInsideArea = true
		$Timer.start()
