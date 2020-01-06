extends Control

var master_mute = savesystem.mute
var width_temp = 960
var height_temp = 540
var custom_res
var volume

func _ready():
	global.settings = self
	# fullscreen
	if OS.get("window_fullscreen") == true:
		$ColorRect/fullscreen_panel/fullscreen_button.text = "ENABLED"
	elif OS.get("window_fullscreen") == false:
		$ColorRect/fullscreen_panel/fullscreen_button.text = "DISABLED"
	# master volume mute
	if master_mute == true:
		$ColorRect/volume_panel/volume_mute.text = "MUTED"
	elif master_mute == false:
		$ColorRect/volume_panel/volume_mute.text = "MUTE"
	
	# debug
	if global.debug == true:
		$ColorRect/debug_panel/debug_button.text = "ENABLED"
	elif global.debug == false:
		$ColorRect/debug_panel/debug_button.text = "DISABLED"
	
	# vsync
	if OS.get("vsync_enabled") == true:
		$ColorRect/vsync_panel/vsync_button.text = "ENABLED"
	elif OS.get("vsync_enabled") == false:
		$ColorRect/vsync_panel/vsync_button.text = "DISABLED"


func _on_fullscreen_button_toggled(button_pressed):
	OS.set("window_fullscreen", button_pressed)
	$clickSound.play()
	if button_pressed == true:
		$ColorRect/fullscreen_panel/fullscreen_button.text = "ENABLED"
		savesystem.save("SCREEN","fullscreen",button_pressed)
	elif button_pressed == false:
		$ColorRect/fullscreen_panel/fullscreen_button.text = "DISABLED"
		savesystem.save("SCREEN","fullscreen",button_pressed)

func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	$clickSound.play()
	savesystem.save("SOUND","volume",value)
	if value <= -50:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		master_mute = true
		$ColorRect/volume_panel/volume_mute.pressed = true
		$ColorRect/volume_panel/volume_mute.text = "MUTED"
		savesystem.save("SOUND","mute",master_mute)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		master_mute = false
		savesystem.save("SOUND","mute",master_mute)
		if master_mute == true:
			$ColorRect/volume_panel/volume_mute.pressed = true
			$ColorRect/volume_panel/volume_mute.text = "MUTED"
		elif master_mute == false:
			$ColorRect/volume_panel/volume_mute.pressed = false
			$ColorRect/volume_panel/volume_mute.text = "MUTE"

func _on_volume_mute_toggled(button_pressed):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), button_pressed)
	master_mute = button_pressed
	$clickSound.play()
	if master_mute == true:
		$ColorRect/volume_panel/volume_mute.text = "MUTED"
		savesystem.save("SOUND","mute",master_mute)
	elif master_mute == false:
		$ColorRect/volume_panel/volume_mute.text = "MUTE"
		savesystem.save("SOUND","mute",master_mute)

func _on_back_pressed():
	global.menu.in_settings = false
	$clickSound.play()
	hide()

func _on_debug_button_toggled(button_pressed):
	global.debug = button_pressed
	$clickSound.play()
	if global.debug == true:
		$ColorRect/debug_panel/debug_button.text = "ENABLED"
		savesystem.save("OTHER","debug",button_pressed)
	elif global.debug == false:
		$ColorRect/debug_panel/debug_button.text = "DISABLED"
		savesystem.save("OTHER","debug",button_pressed)

func _on_vsync_button_toggled(button_pressed):
	OS.set("vsync_enabled", button_pressed)
	$clickSound.play()
	if OS.get("vsync_enabled") == true:
		$ColorRect/vsync_panel/vsync_button.text = "ENABLED"
		savesystem.save("SCREEN","vsync",button_pressed)
	elif OS.get("vsync_enabled") == false:
		$ColorRect/vsync_panel/vsync_button.text = "DISABLED"
		savesystem.save("SCREEN","vsync",button_pressed)

func _on_width_edit_text_changed(new_text):
	width_temp = new_text

func _on_height_edit_text_changed(new_text):
	height_temp = new_text

func _on_apply_button_pressed():
	custom_res = Vector2(float(width_temp), float(height_temp))
	OS.set_window_size(custom_res)
	$clickSound.play()
	savesystem.save("SCREEN","width",width_temp)
	savesystem.save("SCREEN","height",height_temp)
	var screen_size = OS.get_screen_size(0)
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)