extends Area2D
@export var game_over_label: Label
@export var game_over_music: AudioStreamPlayer2D
@export_file("*.tscn") var end_scene_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is RigidBody2D: 
		trigger_game_end()

func trigger_game_end():
	if game_over_music:
		print("Music played")
		game_over_music.play()
		
	get_tree().change_scene_to_file(end_scene_path)
	get_tree().paused = true
	print("Game stopped.")
