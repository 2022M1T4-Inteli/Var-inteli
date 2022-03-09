extends KinematicBody2D

const gravity:float = 1700.0
const speed: = Vector2(800.0, 800.0)
var _velocity: = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	match get_tree().current_scene.name:
		"Hub":
			var is_jump_interrupted:bool = Input.is_action_just_released("jump") and _velocity.y < 0.0
			var direction: = get_physics_direction()
			_velocity = calculate_physics_move_velocity(direction, speed, is_jump_interrupted)
			_velocity = move_and_slide(_velocity, Vector2.UP)
		"Level01":
			var direction: = get_non_physics_direction()
			_velocity = calculate_non_physics_move_velocity(direction, speed)
			_velocity = move_and_slide(_velocity)

func get_physics_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)
	
func get_non_physics_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	 Input.get_action_strength("move_down") - Input.get_action_strength("jump"))

func calculate_physics_move_velocity(
		direction,
		speed,
		is_jump_interrupted
	) -> Vector2:
	var out = _velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out

func calculate_non_physics_move_velocity(
		direction,
		speed
	) -> Vector2:
	var out = _velocity.normalized()
	out.x = speed.x * direction.x
	out.y = speed.y * direction.y
	return out

func _ready():
	OS.window_fullscreen = true # Deixa o jogo em tela cheia

# Termina o jogo caso ESC seja pressionado
func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	
	
