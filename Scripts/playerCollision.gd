extends RigidBody

# simple player collision handler via signal
# send signal only if collides with player instance
func _on_Obstacle_body_shape_entered(body_id, body, body_shape, local_shape):
	if body == global.player:
		global.player.enabled = false
		global.gamemanager.EndGame()