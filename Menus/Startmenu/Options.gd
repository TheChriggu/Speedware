extends Node

func _ready():
	$AudioStreamPlayer.playing = true

func _on_MusicSlider_value_changed(value):
	if value == 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -72)
	elif value == 25:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -36)
	elif value == 50:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -24)
	elif value == 75:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -12)
	elif value == 100:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), 0)

func _on_SFXSlider_value_changed(value):
	if value == 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), -72)
		$SFXExample.playing = true
	elif value == 25:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), -36)
		$SFXExample.playing = true
	elif value == 50:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), -24)
		$SFXExample.playing = true
	elif value == 75:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), -12)
		$SFXExample.playing = true
	elif value == 100:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), 0)
		$SFXExample.playing = true

