extends Area2D

@export_file("*.tscn") var end_scene_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is RigidBody2D: 
		trigger_game_end()

func trigger_game_end():
	await get_tree().create_timer(1.0).timeout # wait for a second
	get_tree().call_deferred("change_scene_to_file", end_scene_path)
