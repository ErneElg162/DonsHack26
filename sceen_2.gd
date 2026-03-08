extends Node2D
@export_file("*.tscn") var game_over_scene: String

var player: RigidBody2D
var start: Vector2
var wind_speed = Vector2(-400, 0)
var death_plane = 250

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Character")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player.apply_force(wind_speed)
	start = player.global_position
	
	if player.global_position.y >= death_plane:
		if game_over_scene == "":
			print("Error: No path!")
			return
		get_tree().paused = false
		get_tree().change_scene_to_file(game_over_scene)
