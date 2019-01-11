extends AnimationPlayer

func NewStop():
	var animation = Animation.new()
	var track_index = animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track_index, "AnimationPlayer")
	animation.track_insert_key(track_index, 0.0, 0)
	animation.track_insert_key(track_index, 0.5, 100)
	
	
	add_animation(find_animation(animation), animation )
	play(find_animation(animation))