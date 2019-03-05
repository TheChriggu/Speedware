extends Control
#This Script is used to Pause the Game
var config = ConfigFile.new()
var SFXvalue 
var MusicValue
var DefaultSettings = int(config.get_value("Options","Music",-24))

func _ready():
	$"Button".grab_focus()
	config.load("user://settings.cfg")
	$SFXslider.value = int(config.get_value("Options","SFX",-24))
	$Musicslider.value = int(config.get_value("Options","Music",-24))


func _input(event):
	if event.is_action_pressed("pause"):
		var newPauseState = not get_tree().paused
		get_tree().paused = newPauseState
		visible = newPauseState
		$"Button".grab_focus()


func _on_SFXslider_value_changed(value):
	SFXvalue = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), SFXvalue)
	if  SFXvalue != DefaultSettings:
		setSFX(SFXvalue)
	config.save("user://settings.cfg")
func setSFX(SFXvalue):
	config.set_value("Options","SFX",SFXvalue)


func _on_Musicslider_value_changed(value):
	MusicValue = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), MusicValue)
	if  MusicValue != DefaultSettings:
		setMusic(MusicValue)
	config.save("user://settings.cfg")
	
func setMusic(Musicvalue):
	config.set_value("Options","Music",Musicvalue)
