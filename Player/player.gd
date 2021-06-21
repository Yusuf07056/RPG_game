extends KinematicBody2D

export(int) var ACCEL = 500
export(int) var MAX_SPEED = 80
export(int) var knockback_speed = 120
export(int) var FRICT = 500

enum{
	MOVE,
	KNOCK,
	ATTACK
}
var state = MOVE
var velocity = Vector2.ZERO
var knock_vector = Vector2.LEFT
onready var animasi = $AnimationPlayer
onready var animasi_tree = $AnimationTree
onready var animasi_state = animasi_tree.get("parameters/playback")
onready var hit_box = $hit_pivot/hit_box

func _ready():
	animasi_tree.active = true
	hit_box.knockback_vector = knock_vector

func _physics_process(delta): 
	match state :
		MOVE:
			move_state(delta)
		KNOCK:
			pass
		ATTACK:
			attack_state(delta)
	
func move_state(delta):
	var inputan = Vector2.ZERO
	inputan.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputan.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputan = inputan.normalized()
	
	if inputan != Vector2.ZERO:
		hit_box.knockback_vector = inputan
		animasi_tree.set("parameters/idle/blend_position", inputan)
		animasi_tree.set("parameters/run/blend_position", inputan)
		animasi_tree.set("parameters/attack/blend_position", inputan)
		animasi_state.travel("run")
		velocity = velocity.move_toward(inputan * MAX_SPEED, ACCEL * delta)
	else:
		animasi_state.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICT * delta)  
	
	move()
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
func knock_state(delta):
	velocity = knock_vector * knockback_speed
	move()
func attack_state(delta):
	animasi_state.travel("attack")
func move():
	velocity =  move_and_slide(velocity)
func animasi_selesai():
	state = MOVE