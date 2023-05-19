extends Spatial

var timer = Timer.new()
onready var animator = $AnimationPlayer

var mainscene = "res://worldcamera/mainscreen.tscn"

var time = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.set_wait_time(time)
	timer.connect("timeout", self, "_on_timer_timeout")
	animator.play("IntroSequence")
	pass
	
func _process(_delta):
	if Input.is_action_pressed("ui_select"):
		nextscene()

	# Remove the old scene
func nextscene():
	get_tree().change_scene(mainscene)
	 # Replace with function body.

