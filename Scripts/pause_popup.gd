extends Panel

var paused = false

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