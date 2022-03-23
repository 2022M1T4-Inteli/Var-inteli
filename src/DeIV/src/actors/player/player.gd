extends KinematicBody2D

const GRAVITY:float = 1700.0
const SPEED: = Vector2(600.0, 800.0)
var _velocity: = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	match get_tree().current_scene.name: # Analisa quais cenas devem receber física e quais não devem.
		"Hub":
			var _direction: = get_non_physics_direction()
			_velocity = calculate_non_physics_move_velocity(_direction, SPEED)
			_velocity = move_and_slide(_velocity)
		_:
			var _direction: = get_physics_direction()
			_velocity = calculate_physics_move_velocity(_direction, SPEED)
			_velocity = move_and_slide(_velocity, Vector2.UP)
			
# Direção dos vetores em uma cena com física.
func get_physics_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)
	
# Direção dos vetores em uma cena sem física.
func get_non_physics_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	 Input.get_action_strength("move_down") - Input.get_action_strength("jump"))
	
# Cálculo dos vetores em uma cena com física.
func calculate_physics_move_velocity(_direction, SPEED) -> Vector2:
	var _out = _velocity
	_out.x = SPEED.x * _direction.x
	_out.y += GRAVITY * get_physics_process_delta_time() # delta_time é o tempo que se passou entre dois frames, utilizado principalmente para manter consistência.
	if _direction.y == -1.0:
		_out.y = SPEED.y * _direction.y
	return _out

# Cálculo dos vetores em uma cema sem física.
func calculate_non_physics_move_velocity(
		_direction,
		SPEED
	) -> Vector2:
	var _out = _velocity.normalized()
	_out.x = SPEED.x * _direction.x
	_out.y = SPEED.y * _direction.y
	return _out

func _on_Morrer_body_entered(_body: Node) -> void:
	get_tree().change_scene("res://src/Levels/level01.tscn")