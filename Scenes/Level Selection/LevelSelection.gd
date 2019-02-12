extends Node

var config = ConfigFile.new()
var SFXvalue 
var MusicValue
var DefaultSettings = int(config.get_value("Options","Music",-24))

func _ready():
	$AudioStreamPlayer.playing = true
	$LevelShortcut.get_node("Button").grab_focus()
	config.load("user://settings.cfg")
	$SFXSlider.value = int(config.get_value("Options","SFX",-24))
	$Musicslider.value = int(config.get_value("Options","Music",-24))
	
	
func _on_SFXSlider_value_changed(value):
	SFXvalue = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), SFXvalue)
	$SFXExample.playing = true
	if  SFXvalue != DefaultSettings:
		setSFX(SFXvalue)
	config.save("user://settings.cfg")
func setSFX(SFXvalue):
	config.set_value("Options","SFX",SFXvalue)



func _on_Musicslider_value_changed(value):
	MusicValue = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), MusicValue)
	$AudioStreamPlayer.playing = true
	$MusicExample.playing = true
	if  MusicValue != DefaultSettings:
		setMusic(MusicValue)
	config.save("user://settings.cfg")
	
func setMusic(Musicvalue):
	config.set_value("Options","Music",Musicvalue)