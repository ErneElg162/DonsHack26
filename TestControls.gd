extends Node2D


var rb: RigidBody2D
var null_path: NodePath = NodePath("")
var impulse = 450
var max_speed = 100

@export var p1_anchor: StaticBody2D
@export var p2_anchor: StaticBody2D
@export var p3_anchor: StaticBody2D

var p1: Player = Player.new()
var p2: Player = Player.new()
var p3: Player = Player.new()

func _ready() -> void:
	rb = get_node(".")
	
	p1.cp = get_node("ControlPoint1")
	p1.joint = get_node("Joint1")
	p1.anchor = p1_anchor.get_path()
	p1.can_cling = false;
	p1.clinging = false
	p1.mask = p1.cp.get_child(0)
	
	p2.cp = get_node("ControlPoint2")
	p2.joint = get_node("Joint2")
	p2.anchor = p2_anchor.get_path()
	p2.can_cling = false;
	p2.clinging = false
	p2.mask = p2.cp.get_child(0)
	
	p3.cp = get_node("ControlPoint3")
	p3.joint = get_node("Joint3")
	p3.anchor = p3_anchor.get_path()
	p3.can_cling = false;
	p3.clinging = false
	p3.mask = p3.cp.get_child(0)


func cling(player: Player):
	if player.can_cling:
		player.joint.node_b = player.anchor
		player.clinging = true

func uncling(player: Player):
	player.joint.node_b = null_path
	player.clinging = false


func force(player: Player, cc: bool):
	if !player.clinging and (p1.can_cling or p2.can_cling or p3.can_cling or p1.clinging or p2.clinging or p3.clinging):
		#var imp = impulse * player.cp.get_relative_transform_to_parent(player.cp.get_parent()).x.normalized()
		
		var imp = Vector2(-impulse, 0).rotated(player.cp.global_rotation)
		#imp.y *= -1
		#imp.rotated(player.cp.rotation)
		var offset = Vector2(player.cp.global_position - rb.global_position)
		
		if cc:
			imp *= -1
		
		rb.apply_impulse(imp, offset)
		print_debug("IMP: ", imp)
		print_debug(imp.angle())
		print_debug("--------------")

func overlap_clingable(player: Player):
	if player.mask.get_overlapping_bodies().size() > 0:
		player.can_cling = true
		
	else:
		player.can_cling = false


func _process(delta: float) -> void:	
	#P1
	if Input.is_action_just_pressed("P1_CC"):
		force(p1, true)
		
	if Input.is_action_just_pressed("P1_C"):
		force(p1, false)
	
	if Input.is_action_pressed("P1_S"):
		cling(p1)
	
	else:
		uncling(p1)
		
	#P2
	if Input.is_action_just_pressed("P2_CC"):
		force(p2, true)
		
	if Input.is_action_just_pressed("P2_C"):
		force(p2, false)
	
	if Input.is_action_pressed("P2_S"):
		cling(p2)
	
	else:
		uncling(p2)
		
	#P3
	if Input.is_action_just_pressed("P3_CC"):
		force(p3, true)
		
	if Input.is_action_just_pressed("P3_C"):
		force(p3, false)
	
	if Input.is_action_pressed("P3_S"):
		cling(p3)
	
	else:
		uncling(p3)
		

	#rb.linear_velocity.limit_length(max_speed)

	#DEBUG
	if Input.is_action_just_pressed("DEBUG"):
		print_debug(rb.rotation)
	
	#Set can_cling
	overlap_clingable(p1)
	overlap_clingable(p2)
	overlap_clingable(p3)
