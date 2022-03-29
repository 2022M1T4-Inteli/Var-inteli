extends KinematicBody2D

var VELOCITY = Vector2(0,0)
const JUMP_FORCE = 900
const speed = 3000

#gravidade
func _process(_delta):
	VELOCITY.y = VELOCITY.y + 30
	VELOCITY = move_and_slide(VELOCITY)
	

	
func _on_Button_pressed():
	VELOCITY.x = speed
	VELOCITY = move_and_slide(VELOCITY)
	VELOCITY = Vector2.ZERO



func _on_Button2_pressed():
	VELOCITY.x = -speed
	VELOCITY = move_and_slide(VELOCITY)
	VELOCITY = Vector2.ZERO

	print(VELOCITY.x)
	
func _on_Button3_pressed():
	VELOCITY.y = -JUMP_FORCE
	VELOCITY = move_and_slide(VELOCITY, Vector2.UP)
