extends Panel

# var that changes if you press the pause
var paused = false

# input func that sets the var value and shows/hide pause popup with fancy blur *o*
func _process(delta):
	if Input.is_action_just_pressed("ui_pause") and !global.gamemanager.gameHasEnded:
		if paused == false:
			paused = true
			show()
			get_tree().paused = true
		else:
			paused = false
			hide()
			get_tree().paused = false