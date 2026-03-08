extends CharacterBody2D

@export var speed = 100.0
@export var dist_left: int = 250
@export var dist_right: int = 250

var init_pos: int

var mov_right = true

func _ready() -> void:
	init_pos = global_position.x

func _physics_process(_delta):
	if mov_right:
		velocity.x = speed
	else:
		velocity.x = -speed
		
	if global_position.x >= init_pos + dist_right:
		mov_right = false
		$Sprite2D.flip_h = false # CITE: ask llm for this line: move the picture flip
	elif global_position.x <= init_pos - dist_left:
		mov_right = true
		$Sprite2D.flip_h = true
	move_and_slide()
