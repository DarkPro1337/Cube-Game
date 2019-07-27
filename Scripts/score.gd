extends Label

# player score = z player position, simple as that
func _physics_process(delta):
	text = str(int(global.player.translation.z))