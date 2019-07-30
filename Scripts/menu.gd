extends Control

var button = {0: Vector2(404, 307), 1: Vector2(404, 361), 2: Vector2(404, 415)}
var selection = 0
var in_settings = false

# enables fadeout
func _ready():
	global.menu = self
	fadeOut_enable()
	$Welcome/Selection.rect_position = button[0]

func selection_check():
	if selection < 0:
		selection = 0
	elif selection > 2:
		selection = 2

func _process(delta):
	if Input.is_action_just_pressed("ui_up") and in_settings == false:
		selection -= 1
		selection_check()
		$Welcome/Selection.rect_position = button[selection]
	elif Input.is_action_just_pressed("ui_down") and in_settings == false:
		selection += 1
		selection_check()
		$Welcome/Selection.rect_position = button[selection]
	
	if Input.is_action_just_pressed("ui_accept") and in_settings == false:
		if selection == 0:
			_on_Start_pressed()
		elif selection == 1:
			_on_Settings_pressed()
		elif selection == 2:
			_on_Quit_pressed()

# GODOT STILL DOESN'T HAVE "HIDE IN EDITOR" FEATURE >_<
func fadeOut_enable():
	$FadeOut.visible = true

# simple start button, loads first level
func _on_Start_pressed():
	get_tree().change_scene_to(load("res://Scenes/Levels/Level01.tscn"))

# opens settings on press
func _on_Settings_pressed():
	in_settings = true
	$Settings.show()

# quit on press
func _on_Quit_pressed():
	get_tree().quit()

func _on_Start_mouse_entered():
	selection = 0
	$Welcome/Selection.rect_position = button[selection]

func _on_Settings_mouse_entered():
	selection = 1
	$Welcome/Selection.rect_position = button[selection]

func _on_Quit_mouse_entered():
	selection = 2
	$Welcome/Selection.rect_position = button[selection]