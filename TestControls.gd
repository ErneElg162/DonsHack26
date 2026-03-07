extends Node2D

var rb: RigidBody2D

var cp1: Node2D
var joint1: Joint2D
@export var hidden1: StaticBody2D

var cp2: Node2D

var boop = Vector2(0, -200);

func _ready() -> void:
	rb = get_node(".")
	
	cp1 = get_node("ControlPoint1")
	joint1 = get_node("Joint1")
	
	cp2 = get_node("ControlPoint2")
	

func cling():
	hidden1.global_position = cp1.global_position
	joint1.node_b = hidden1.get_path()

func uncling():
	joint1.node_b = NodePath("")


func force():
	rb.apply_impulse(boop, cp2.position)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Up"):
		force()
	
	if Input.is_action_just_pressed("Cling"):
		print_debug("CLINGED")
		cling()
		
	if Input.is_action_just_released("Cling"):
		print_debug("UNCLINGED")
		uncling()
