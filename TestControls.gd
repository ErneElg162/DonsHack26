extends Node2D

var rb: RigidBody2D
var null_path: NodePath = NodePath("")

var cp1: Node2D
var joint1: Joint2D

@export var hidden1: StaticBody2D
var hidden1_path: NodePath

var cp2: Node2D

var boop = Vector2(0, -200);

func _ready() -> void:
	rb = get_node(".")
	
	cp1 = get_node("ControlPoint1")
	joint1 = get_node("Joint1")
	hidden1_path = hidden1.get_path()
	
	#joint1.set_physics_process(false)
	#hidden1.set_process(false)
	
	cp2 = get_node("ControlPoint2")


func cling():
	joint1.node_b = hidden1_path
	#hidden1.global_position = cp1.global_position
	#joint1.global_position = hidden1.global_position
	
	#joint1.set_physics_process(true)
	#hidden1.set_process(true)

func uncling():
	joint1.node_b = NodePath("")
	#pass
	#joint1.set_physics_process(false)
	#hidden1.set_process(false)


func force():
	rb.apply_impulse(boop, cp2.position)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Up"):
		force()
	
	if Input.is_action_just_pressed("Cling"):
		cling()
		
	if Input.is_action_just_released("Cling"):
		uncling() 
		
	if Input.is_action_just_pressed("Down"):
		print_debug("Hidden: ", hidden1.global_position)
		print_debug("Joint: ", get_node(joint1.node_b).global_position)
