extends Node2D
@export var start_button : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	start_button.visible = true
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	get_tree().paused = false
	start_button.visible = false
	print("Start game!")
