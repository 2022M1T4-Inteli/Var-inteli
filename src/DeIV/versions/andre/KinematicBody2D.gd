extends KinematicBody2D

var _velocity = Vector2(0,0)
const JUMP_FORCE = 900
const speed = 3000

#gravidade
func _process(_delta):
	_velocity.y = _velocity.y + 30
	_velocity = move_and_slide(_velocity)
	

	
func _on_Button_pressed():
	_velocity.x = speed
	_velocity = move_and_slide(_velocity)
	_velocity = Vector2.ZERO



func _on_Button2_pressed():
	_velocity.x = -speed
	_velocity = move_and_slide(_velocity)
	_velocity = Vector2.ZERO

	print(_velocity.x)
	
func _on_Button3_pressed():
	_velocity.y = -JUMP_FORCE
	_velocity = move_and_slide(_velocity, Vector2.UP)
