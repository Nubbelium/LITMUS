extends Camera

onready var shaketimer = $Timer
onready var tween = $Tween

export var shaking = true

var shake_amount = 0
var default_v_offset = v_offset
var default_h_offset = h_offset


func _ready():
	Global.camera = self
	set_process(false)
	
func _process(delta):
	v_offset = rand_range(-shake_amount, shake_amount) * delta + default_v_offset
	h_offset = rand_range(-shake_amount, shake_amount) * delta + default_h_offset
	if shaking:
		shake(300,0.5,100)
	pass
	
func shake(new_shake, shake_time, shake_limit):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit
		
	shaketimer.wait_time = shake_time
	
	tween.stop_all()
	set_process(true)
	shaketimer.start()
	
func _on_Timer_timeout():
	shake_amount = 0
	set_process(false)
	
	tween.interpolate_property(self, "v_offset", v_offset, 0, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.interpolate_property(self, "h_offset", h_offset, 0, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
	shaking = false

