extends Node

func _ready():
	$AudioStreamPlayer.playing = true

func _on_HSlider_value_changed(value):
	if value == 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -72)
	elif value == 25:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -36)
	elif value == 50:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -24)
	elif value == 75:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -12)
	elif value == 100:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)