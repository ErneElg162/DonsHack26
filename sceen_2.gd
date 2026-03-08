extends Node2D

var player: RigidBody2D
var wind_speed = Vector2(-1000, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Character")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player.apply_force(wind_speed)
