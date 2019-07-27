extends Control

# singleton var
func _ready():
	global.canvas = self
	fadeOut_enable()

func fadeOut_enable():
	$FadeOut.visible = true

# func for starting animations
func playAnim(anim):
	$AnimationPlayer.play(anim)

# func that contains final count of levels
# if you will add more levels to game in future, change "global.current_stage" value in if statement
# to number of levels you have + 1 (credits scene)
func next_level():
	if global.current_stage == 4:
		get_tree().change_scene_to(load("res://Scenes/Credits.tscn"))
	else:
		get_tree().change_scene_to(load("res://Scenes/Levels/Level0" + str(global.current_stage) + ".tscn"))