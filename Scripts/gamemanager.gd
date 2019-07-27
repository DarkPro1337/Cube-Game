extends Spatial

# init vars
var gameHasEnded = false
var restartDelay = 1
var slowMotion = 0.4

# singleton var
func _ready():
	global.gamemanager = self

# func that restart scene with delay (godot has no analogue of invoke, so it's simple timer :P)
# also it now enables slow motion if you fails level, FEATURES!
func EndGame():
	if gameHasEnded == false:
		gameHasEnded = true
		print("GAME OVER!") # for debugging
		Engine.set_time_scale(slowMotion)
		global.invoke.start(restartDelay)

# func that loads you to next level with fancy animation
func CompleteLevel():
	global.canvas.playAnim("completeLevel")
	global.player.enabled = false
	global.current_stage += 1

# timer signal and restart func
func _on_invoke_timeout():
	Engine.set_time_scale(1) # sets time scale to default
	restart()

func restart():
	get_tree().reload_current_scene()