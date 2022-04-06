extends KinematicBody2D

var _velocity = Vector2.ZERO
var _direction
var _jump = false
const GRAVITY:float = 1700.0
const speed = Vector2(6000,1200)

#gravidade
func _physics_process(_delta: float) -> void:
	_direction = get_direction()
	_velocity = calculate_physics_move_velocity(speed)
	_velocity = move_and_slide(_velocity, Vector2.UP)


func get_direction():
	return -1.0 if _jump else 1.0
	

func calculate_physics_move_velocity(speed) -> Vector2:
	var _out = _velocity
	_out.y += GRAVITY * get_physics_process_delta_time() # delta_time é o tempo que se passou entre dois frames, utilizado principalmente para manter consistência.
	if _direction == -1.0:
		_out.y = speed.y * _direction
	_jump = false
	global.UP = false
	return _out
	

func _right():
	_velocity.x = speed.x
	_velocity = move_and_slide(_velocity)
	_velocity.x = 0
	global.RIGHT = false


func _left():
	_velocity.x = -speed.x
	_velocity = move_and_slide(_velocity)
	_velocity.x = 0
	global.LEFT = false
	
	
func _on_ButtonLeft_pressed() -> void:
	if global.npc_level04_done and global.LEFT:
		_left()


func _on_ButtonRight_pressed() -> void:
	if global.npc_level04_done and global.RIGHT:
		_right()
#
#
func _on_ButtonJump_pressed() -> void:
	if global.npc_level04_done and global.UP:
		_jump = true
