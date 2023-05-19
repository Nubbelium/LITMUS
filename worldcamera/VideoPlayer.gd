extends VideoPlayer


var video_player
var video

func _ready():
	video = preload("res://video/Demo.webm")
	set_stream( video )
	set_process( true )

func _process(_delta):
	if not is_playing():
		play()
