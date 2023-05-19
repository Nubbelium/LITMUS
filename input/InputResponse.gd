extends MarginContainer


onready var zebra = $Zebra
onready var input_label = $Rows/InputHistory
onready var response_label = $Rows/Response



var current_char = 0
var _response = " "
var i = 0
var starter
var typing_speed = 0.001
var timer = Timer.new()

func _ready():
	starter = Global.getstarter()
	add_child(timer)
	timer.set_wait_time(typing_speed)
	timer.connect("timeout", self, "_on_timer_timeout")
	

func set_text(response: String, input: String = ""):
	typing_speed = Global.gettypespeed()
	timer.set_wait_time(typing_speed)
	if input == "":
		input_label.queue_free()
	else:
		input_label.text = input + " < " 
		
		if typing_speed == 0:
			response_label.bbcode_text = response
		else:
			Global.settyping(true)
			timer.start()
	if starter:
		response_label.bbcode_text = response
	_response = response	

func _on_timer_timeout():
	Global.setstarter(false)
	var text = _response
	text = text.replace("[/color]", "")
	text = text.replace("[color=#ffff9a94]", "")
	text = text.replace("[color=#ff94b9ff]", "")
	text = text.replace("[color=#ffc3ff94]", "")
	text = text.replace("[color=#fffaff94]", "")
	text = text.replace("[color=#ffffd394]", "")
	response_label.bbcode_text = text.left(i)
	i += Global.charsetspeed
	if i > text.length():
		response_label.bbcode_text = _response
		Global.settyping(false)
		timer.stop()
		

