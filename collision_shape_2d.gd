extends CollisionShape2D



@export var game_over_label: Label
@export var game_over_music: AudioStreamPlayer2D
@export_file("*.tscn") var end_scene_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is RigidBody2D: 
		trigger_game_end()
