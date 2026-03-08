extends Node2D


@export var back_button : Button
@export_file("*.tscn") var start_scene_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_button.visible = true
	back_button.pressed.connect(_on_back_button_pressed)

func _on_back_button_pressed():
	if start_scene_path == "":
		print("Error: No path!")
		return
	
	get_tree().change_scene_to_file(start_scene_path)
	print("Back to start scene!")
