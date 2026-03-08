extends Area2D
@export_file("*.tscn") var win_scene: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print_debug("A")
	if body is RigidBody2D: 
		print_debug("B")
		trigger_game_end()

func trigger_game_end():	
	get_tree().paused = false
	get_tree().change_scene_to_file(win_scene)
