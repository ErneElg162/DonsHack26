extends Node2D


@export var start_button_easy : Button
@export var start_button_hard : Button
@export_file("*.tscn") var game_scene_path: String # ask LLM here aboutt how to use dynamic attached path
@export_file("*.tscn") var game_scene_path_hard: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button_easy.visible = true
	start_button_easy.pressed.connect(_on_starteasy_button_pressed)
	start_button_hard.pressed.connect(_on_starthard_button_pressed)

func _on_starteasy_button_pressed():
	if game_scene_path == "":
		print("Error: No path!")
		return
	get_tree().paused = false
	get_tree().change_scene_to_file(game_scene_path)
	
func _on_starthard_button_pressed():
	if game_scene_path == "":
		print("Error: No path!")
		return
	get_tree().paused = false
	get_tree().change_scene_to_file(game_scene_path_hard)
