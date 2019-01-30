extends Node

func _ready():
	#$Chatlog1.get_node("OpenChatlogButton").grab_focus()
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main Menu/TitleScreen.tscn")