extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 100
const SPEED = 400
const JUMP_HEIGHT = -600

func _physics_process(delta):
	var motion = Vector2()
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	if Input.is_action_just_released("ui_left"):
		motion.x = 0
	if Input.is_action_just_released("ui_right"):
		motion.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y -= JUMP_HEIGHT
		
	motion = move_and_slide(motion, UP)
	print(motion)
	pass