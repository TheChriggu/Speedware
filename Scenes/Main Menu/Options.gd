extends Node

func _ready():
	$AudioStreamPlayer.playing = true
	$MusicSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	$SFXSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))

func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	$AudioStreamPlayer.playing = true

func _on_SFXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	$SFXExample.playing = true