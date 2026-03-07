extends Node2D
var game_scene_path = "res://sceen_1.tscn"
@export var start_button : Button

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	start_button.visible = true
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(game_scene_path)
	
