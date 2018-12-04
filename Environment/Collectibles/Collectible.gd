extends Sprite

func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("Collectible_collected")
	#$CollectiblesCollected.CollectiblesCollected()
	get_parent().get_node("UI/CollectiblesCollected").CollectiblesCollected()