extends Control

var button = {0: Vector2(5, 4.883), 1: Vector2(5, 5.147), 2: Vector2(5, 5)}
var selection = 0
var in_settings = false
var selected

# enables fadeout
func _ready():
	global.menu = self
	_on_Welcome_resized()
	fadeOut_enable()
	$Welcome/Selection.rect_position = $Welcome/Start.rect_position - Vector2(5, 4.883)

func selection_check():
	if selection < 0:
		selection = 0
	elif selection > 2:
		selection = 2

func _process(delta):
	selected = {0: Vector2($Welcome/Start.rect_position), 1: Vector2($Welcome/Settings.rect_position), 2: Vector2($Welcome/Quit.rect_position)}
	if Input.is_action_just_pressed("ui_up") and in_settings == false:
		selection -= 1
		selection_check()
		$Welcome/Selection.rect_position = selected[selection] - button[selection]
	elif Input.is_action_just_pressed("ui_down") and in_settings == false:
		selection += 1
		selection_check()
		$Welcome/Selection.rect_position = selected[selection] - button[selection]
	
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
	$Welcome/Selection.rect_position = selected[selection] - button[selection]

func _on_Settings_mouse_entered():
	selection = 1
	$Welcome/Selection.rect_position = selected[selection] - button[selection]

func _on_Quit_mouse_entered():
	selection = 2
	$Welcome/Selection.rect_position = selected[selection] - button[selection]

func _on_Welcome_resized():
	selected = {0: Vector2($Welcome/Start.rect_position), 1: Vector2($Welcome/Settings.rect_position), 2: Vector2($Welcome/Quit.rect_position)}