extends Area2D

export var FIXED_CAMERA = true
signal newCamAreaEntered

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Collider1_body_entered(body):
	if body.get_name() == "player":
		emit_signal("newCamAreaEntered", position.y, FIXED_CAMERA)
	pass # replace with function body
