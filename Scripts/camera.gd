extends Camera

# export var that you can change from node inspector, like in unity
export var offset = Vector3(0, 1, -5)

# singleton var
func _ready():
	global.camera = self

# camera follows cube uses offset, remove it and you get first person view :P
func _physics_process(delta):
	translation = global.player.translation + offset