extends Spatial

onready var animator = $AnimationPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	animator.play("Transition")
	pass # Replace with function body.

func _on_Game_room_changed2(new_room):
	var buffer = str(new_room)
	print(buffer.substr(0,9))
	buffer = buffer.substr(0,9)
	match buffer:
		"BackOfInn":
			animator.play("void to forest")
			return
	#animator.play("Transition")
	pass # Replace with function body
	


func _on_Game_end_dialog():
	animator.play("endtalk_Transition")
	pass # Replace with function body.


func _on_Game_start_dialog():
	animator.play("Talk_Transition")
	pass # Replace with function body.

