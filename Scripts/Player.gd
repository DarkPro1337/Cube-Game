extends RigidBody

# export vars that you can change from node inspector, like in unity
export var forwardForce = 2000
export var sidewaysForce = 500

# init vars
var motion = Vector3()
var enabled = true
var leftKey
var rightKey

# singleton var
func _ready():
	global.player = self

# brackeys said that in unity this is better for player input, so it's here ¯\_(ツ)_/¯
# left and right bool values
# analogue of void update() in unity
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		leftKey = true
	else:
		leftKey = false
	
	if Input.is_action_pressed("ui_right"):
		rightKey = true
	else:
		rightKey = false

# player input and adding force to the cube
# analogue of void fixedupdate() in unity
# also here are the endgame if you fall from the platform, it's meant to be in gamemanager, but i'm lazy ^_^
func _physics_process(delta):
	if enabled == true:
		add_central_force(Vector3(0, 0, forwardForce * delta))
		if leftKey == true:
			add_central_force(Vector3(sidewaysForce * delta, 0, 0))
		if rightKey == true:
			add_central_force(Vector3(-sidewaysForce * delta, 0, 0))
		if translation.y < -1:
			enabled = false
			global.gamemanager.EndGame()