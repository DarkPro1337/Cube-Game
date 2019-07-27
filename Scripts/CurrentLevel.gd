extends Label

# UI label that shows current level number
func _physics_process(delta):
	text = "LEVEL: " + str(global.current_stage)