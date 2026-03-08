extends Node2D


@export var start_button : Button
@export_file("*.tscn") var game_scene_path: String # ask LLM here aboutt how to use dynamic attached path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.visible = true
	start_button.pressed.connect(_on_back_button_pressed)

func _on_back_button_pressed():
	if game_scene_path == "":
		print("Error: No path!")
		return
	get_tree().paused = false
	get_tree().change_scene_to_file(game_scene_path)
	print("Back to start scene!")
