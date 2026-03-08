extends Button

var game_scene_path = "res://sceen_1.tscn"
func _on_start_button_pressed():
	get_tree().change_scene_to_file(game_scene_path)
	
	get_tree().paused = false
