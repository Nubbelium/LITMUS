extends Node

onready var shader = "res://shaders/ascii-shader/Template1/fineshader.tres"

# Settings
var setfullscreen = true
var typespeed = 0.01
var charsetspeed = 4
var volume = 50
var retromode = true
# Game state
var starter = true
var typing = false
var camera = null
var currentRoom = "Unknown"

#	pass
func quit():
	get_tree().quit()

func togglefullscreen():
	if setfullscreen:
		OS.window_fullscreen = true
		setfullscreen = false
		OS.set_window_size(Vector2(1920,1080))
	else:
		OS.window_fullscreen = false
		setfullscreen = true
		OS.set_window_size(Vector2(1280,720))

func gettypespeed():
	return typespeed
	
func settypespeed(value):
	typespeed = value
	pass

func getstarter():
	return starter
	
func setstarter(value):
	starter = value
	pass

func gettyping():
	return typing
	
func settyping(value):
	typing = value
	pass
	
func getvolume():
	return volume
	
func setvolume(value):
	volume = value
	pass

