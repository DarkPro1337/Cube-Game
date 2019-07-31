extends Camera

# export var that you can change from node inspector, like in unity
export var offset = Vector3(0, 1, -5)
var fov_change

# singleton var
func _ready():
	global.camera = self
	fov_change = 70

func change_fov(value):
	fov = value

# camera follows cube uses offset, remove it and you get first person view :P
func _physics_process(delta):
	if fov_change < 90:
		fov_change += 0.05
		fov = fov_change
	elif fov_change == 90:
		fov_change = 90
	print(fov)
	translation = global.player.translation + offset