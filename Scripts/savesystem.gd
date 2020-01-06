extends Node

var savepath = "res://settings.cfg"
var config = ConfigFile.new()
var loadcfg = config.load(savepath)

var vsync = config.get_value("SCREEN","vsync")
var fullscreen = config.get_value("SCREEN","fullscreen")
var width = config.get_value("SCREEN","width")
var height = config.get_value("SCREEN","height")
var cfg_res
var volume = config.get_value("SOUND","volume")
var mute = config.get_value("SOUND","mute")
var debug = config.get_value("OTHER","debug")

func save(section, key, value):
	config.set_value(section, key, value)
	config.save(savepath)

func loadit(section, key):
	config.get_value(section, key)

func _ready():
	if loadcfg == OK:
		if config.has_section_key("SCREEN","vsync"):
			OS.set("vsync_enabled", vsync)
		if config.has_section_key("SCREEN","vsync"):
			OS.set("window_fullscreen", fullscreen)
		if config.has_section_key("SCREEN","width") and config.has_section_key("SCREEN","height"):
			cfg_res = Vector2(float(width), float(height))
			OS.set_window_size(cfg_res)
			var screen_size = OS.get_screen_size(0)
			var window_size = OS.get_window_size()
			OS.set_window_position(screen_size*0.5 - window_size*0.5)
		if config.has_section_key("SOUND","volume"):
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)
		if config.has_section_key("SOUND","mute"):
			AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), mute)
		if config.has_section_key("OTHER","debug"):
			global.debug = debug