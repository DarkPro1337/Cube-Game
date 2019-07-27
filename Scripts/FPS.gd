extends Label

# for performance tests
func _process(delta):
	text = str(Performance.get_monitor(Performance.TIME_FPS)) + " FPS"