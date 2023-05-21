extends Control

signal room_changed2(new_room)

onready var game_info = $Background/MarginContainer/Columns/Rows/GameInfo
onready var command_processor = $CommandProcessor
onready var room_manager = $RoomManager
onready var player = $Player
signal start_dialog()
signal end_dialog()


func _ready() -> void:
	var side_panel = $Background/MarginContainer/Columns/SidePanel
	command_processor.connect("room_changed", side_panel, "handle_room_changed")
	command_processor.connect("room_updated", side_panel, "handle_room_updated")

	game_info.create_response(Types.wrap_system_text("Welcome to LITMUS! You can type 'help' to see available commands or you can type 'settings' to view game settings."))

	var starting_room_response = command_processor.initialize(room_manager.get_child(0), player)
	game_info.create_response(starting_room_response)


func _on_Input_text_entered(new_text: String) -> void:
	if new_text.empty():
		return

	var response = command_processor.process_command(new_text)
	game_info.create_response_with_input(response, new_text)
	

func _on_CommandProcessor_room_changed(new_room):
	emit_signal("room_changed2", new_room)
	pass # Replace with function body.


func _on_CommandProcessor_set_visibility(x):
	emit_signal("start_dialog")
	
	pass # Replace with function body.

func _on_CommandProcessor_event_end(type):
	emit_signal("end_dialog")
	pass # Replace with function body.
