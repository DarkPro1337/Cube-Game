extends Area

# singleton var
func _ready():
	global.end = self

# simple player collision handler via signal
# ends level once player collides with end area
func _on_End_body_entered(body):
	if body == global.player and global.player.enabled == true:
		global.gamemanager.CompleteLevel()