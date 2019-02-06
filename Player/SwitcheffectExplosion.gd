extends Node2D

export var TIMER_TIME = 0.1 #Time until emission stops
export var MAX_OVERLAYING_PARTICLES = 10 #maximum of overlaying particles
var nextChild = 0 #tracker, to activate the proper next particle effect

func _ready():
	CreateParticles() #create all particle effects
	SetTimerTime() #set the proper time for all of them

#create MAX_OVERLAYING_PARTICLES amount of particle effects, and set them as children
func CreateParticles():
	var particles = preload("res://Player/Particles/ExplosionParticles.tscn")
	for i in range(MAX_OVERLAYING_PARTICLES):
		var newInstance = particles.instance()
		add_child(newInstance)

#set the timer for all children to TIMER_TIME
func SetTimerTime():
	for particles2D in get_children():
		particles2D.SetTimerTime(TIMER_TIME)

#Fire particle in next child. Then increase the tracker
func FireParticles():
	var particle = get_children()[nextChild]
	particle.emitting = true
	particle.StartTimer()
	nextChild += 1
	nextChild %= MAX_OVERLAYING_PARTICLES


func OrangeToPurple():
	for particle in get_children():
		particle.OrangeToPurple()

func PurpleToOrange():
	for particle in get_children():
		particle.PurpleToOrange()