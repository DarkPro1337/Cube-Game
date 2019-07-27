extends Control

# enables fadeout
func _ready():
	fadeOut_enable()

# GODOT STILL DOESN'T HAVE "HIDE IN EDITOR" FEATURE >_<
func fadeOut_enable():
	$FadeOut.visible = true

# simple start button, loads first level
func _on_Start_pressed():
	get_tree().change_scene_to(load("res://Scenes/Levels/Level01.tscn"))

# quit on press
func _on_Quit_pressed():
	get_tree().quit()

# sets fullscreen
func _on_FullScreen_toggled(button_pressed):
	OS.set("window_fullscreen", button_pressed)