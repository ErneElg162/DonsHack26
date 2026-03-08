extends Path2D

var path_follow: PathFollow2D
var time: float = 0

@export var speed: float = 100

func get_prog(time: float) -> float:
	return -abs(2 * time - 1) + 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	path_follow = get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta * speed / curve.get_baked_length()
	time = fmod(time, 1)
	
	path_follow.progress_ratio = get_prog(time)

	if Input.is_action_just_pressed("DEBUG"):
		print_debug(time)
		print_debug(get_prog(time))
		print_debug(path_follow.progress_ratio)
		print_debug("------------------------")
