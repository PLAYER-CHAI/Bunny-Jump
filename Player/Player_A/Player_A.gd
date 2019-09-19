extends KinematicBody2D

var motion = Vector2(0,0)

export var SPEED = 500 #ค่าความเร็วเริ่มต้น
export var JUMP = 900 #ค่าความเร็วเริ่มต้น
export var GRAVITY = 60 #ค่าความเร็วเริ่มต้น

func _physics_process(delta): #ตัวแปรพิเศษ
	
	apply_gravity()
	jump()
	walk()
	
	move_and_slide(motion, Vector2(0,-1))
	
func apply_gravity():
	motion.y = motion.y + GRAVITY
	if is_on_floor():
		motion.y = 0
		print("I'm floor")

func jump():
	if Input.is_action_just_pressed("jump_A"):
		motion.y = -JUMP
		print("I'm jumped")

func walk():
	if Input.is_action_pressed("left_A") and not Input.is_action_pressed("right_A"):
		motion.x = -SPEED
		print("I'm walk left")
	elif Input.is_action_pressed("right_A") and not Input.is_action_pressed("left_A"):
		motion.x = SPEED
		print("I'm walk right")
	else:
		motion.x = 0