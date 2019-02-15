extends Node2D

#timer is designed to give off a signal as accurately as possible to every 11.852 seconds, which is half the length of the layer tracks
signal timeout
var length = 11.825
var currentTime = length
var wiggle = 0.009

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	currentTime -= delta
	
	#if timer has gone for too long (delta too large), don't emit signal, restart the timer
	if currentTime < -wiggle:
		currentTime += length
		
	elif currentTime < wiggle && currentTime > -wiggle:
		emit_signal("timeout")
		currentTime += length