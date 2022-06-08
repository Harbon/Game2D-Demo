extends KinematicBody2D
class_name Player

var gravity = 30
var h_speed = 200
var v_speed = 700
const move_vec = Vector2()
const up_deter = Vector2(0, -1)

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		move_vec.x = h_speed
	elif Input.is_action_pressed("ui_left"):
		move_vec.x = -h_speed
	else:
		move_vec.x = 0
	
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		move_vec.y = -v_speed
		
	
	
	move_and_slide(move_vec, up_deter)
	
	if not is_on_floor():
	  move_vec.y += gravity
	else:
		move_vec.y = 0
	
	if move_vec.x > 0:
		$Sprite.flip_h = false
	elif move_vec.x < 0:
		$Sprite.flip_h = true
	
	if abs(move_vec.x) > 0 and is_on_floor():
		$AnimationPlayer.play("run")
	elif abs(move_vec.y) > 0 and not is_on_floor():
		$AnimationPlayer.play("jump")
	else:
		$AnimationPlayer.play("idle")
	
	
