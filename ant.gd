extends CharacterBody2D

@export var speed = 100.0

const left_edge = 0
const right_edge = 500
var mov_right = true

func _physics_process(_delta):
	if mov_right:
		velocity.x = speed
	else:
		velocity.x = -speed
		
	if global_position.x >= right_edge:
		mov_right = false
		$Sprite2D.flip_h = false # CITE: ask llm for this line: move the picture flip
	elif global_position.x <= left_edge:
		mov_right = true
		$Sprite2D.flip_h = true
	move_and_slide()
