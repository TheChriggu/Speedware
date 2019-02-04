extends Node

var configPath = "user://settings.cfg"

func loadSaveGame():
	
	var config = ConfigFile.new()
	var err = config.load(ConfigPath)
	
	if err == OK:
	    var screen_width = get_value("display", "width", 1024)
	    if not config.has_section_key("audio", "mute"):
	        config.set_value("audio", "mute", false)
	    config.save(Config)
