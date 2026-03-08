extends Node2D
@export var start_button : Button
var death_plane = 250
var start_x;
var start_y;

var player: RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Character")
	start_x = player.global_position.x
	start_y = player.global_position.y
	
	get_tree().paused = true
	start_button.visible = true
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	get_tree().paused = false
	start_button.visible = false
	print("Start game!")

func _process(delta: float) -> void:
	if player.global_position.y >= death_plane:
		player.global_position.x = start_x
		player.global_position.y = start_y
