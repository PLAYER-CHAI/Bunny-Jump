extends KinematicBody2D

var motion = Vector2(0,1000)

export var SPEED = 500 #ค่าความเร็วเริ่มต้น
export var JUMP = 700 #ค่าความเร็วเริ่มต้น

func _physics_process(delta): #ตัวแปรพิเศษ
	if Input.is_action_pressed("left_B") and not Input.is_action_pressed("right_B"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right_B") and not Input.is_action_pressed("left_B"):
		motion.x = SPEED
	else:
		motion.x = 0
	
	if Input.is_action_pressed("jump_B"):
		motion.y = -JUMP
	else:
		motion.y = 600
	move_and_slide(motion)
	