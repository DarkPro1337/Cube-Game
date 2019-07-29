extends ColorRect

# counts how many times ESC was pressed
var ESC_press = 0

# input func (yeah, it's too animated, why not?)
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$AnimationPlayer.play("FadeOut")
		show()
		$Timer.start()
		ESC_press += 1
		if ESC_press == 2:
			global.current_stage = 1
			get_tree().change_scene_to(load("res://Scenes/Menu.tscn"))

# timer signal
func _on_Timer_timeout():
	ESC_press = 0
	hide()