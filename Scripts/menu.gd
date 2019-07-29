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

# opens settings on press
func _on_Settings_pressed():
	$Settings.show()

# sets fullscreen
func _on_FullScreen_toggled(button_pressed):
	OS.set("window_fullscreen", button_pressed)

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	if value <= -100:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)