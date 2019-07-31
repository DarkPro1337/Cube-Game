extends Control

# singleton var
func _ready():
	global.canvas = self
	if global.debug == false:
		$Debug.visible = false
	elif global.debug == true:
		$Debug.visible = true
	fadeOut_enable()

func fadeOut_enable():
	$FadeOut.visible = true

# func for starting animations
func playAnim(anim):
	$AnimationPlayer.play(anim)

func _process(delta):
	$Debug/X.text = "X: " + str(global.player.translation.x)
	$Debug/Y.text = "Y: " + str(global.player.translation.y)
	$Debug/Z.text = "Z: " + str(global.player.translation.z)
	$Debug/RAM.text = "RAM: " + str((Performance.get_monitor(Performance.MEMORY_STATIC) / 1.049e+6 + (Performance.get_monitor(Performance.MEMORY_DYNAMIC)) / 1.049e+6)) + " MB"
	$Debug/VRAM.text = "VRAM: " + str((Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED) / 1.049e+6)) + " MB"

# func that contains final count of levels
# if you will add more levels to game in future, change "global.current_stage" value in if statement
# to number of levels you have + 1 (credits scene)
func next_level():
	if global.current_stage == 5:
		get_tree().change_scene_to(load("res://Scenes/Credits.tscn"))
	else:
		get_tree().change_scene_to(load("res://Scenes/Levels/Level0" + str(global.current_stage) + ".tscn"))