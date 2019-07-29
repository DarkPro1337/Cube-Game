extends Control

# enables fadeout
func _ready():
	fadeOut_enable()

# GODOT STILL DOESN'T HAVE "HIDE IN EDITOR" FEATURE >_<
func fadeOut_enable():
	$FadeOut.visible = true

# quit button, guess what it's doing
func _on_Quit_pressed():
	get_tree().quit()

# start game again from first level
func _on_Retry_pressed():
	global.current_stage = 1
	get_tree().change_scene_to(load("res://Scenes/Levels/Level01.tscn"))

func _on_Menu_pressed():
	global.current_stage = 1
	get_tree().change_scene_to(load("res://Scenes/Menu.tscn"))