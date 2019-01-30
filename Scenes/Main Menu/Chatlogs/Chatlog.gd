extends Node2D

func _on_OpenChatlogButton_pressed():
	$AnimationPlayer.play("OpenChatlog")


func _on_CloseChatlogButton_pressed():
	$AnimationPlayer.play("CloseChatlog")
