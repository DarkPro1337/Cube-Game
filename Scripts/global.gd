extends Node

# singleton vars
var player
var camera
var invoke
var gamemanager
var end
var canvas
var debug = false

# current level counter
var current_stage = 1

func _init():
	OS.set_window_size(Vector2(960, 540))