extends KinematicBody2D

const GRAVITY:float = 1700.0
const SPEED: = Vector2(600.0, 800.0)
var _velocity: = Vector2.ZERO
var push = 100
var count = 0

func _ready():
	match get_tree().current_scene.name:
		"Tutorial":
			$Camera/CanvasLayer/Reset.visible = false
		"Level02":
			$Camera/CanvasLayer/Label.visible = false
			$Camera/CanvasLayer/Right.visible = false
			$Camera/CanvasLayer/Left.visible = false
			$Camera/CanvasLayer/Up.visible = false
			$Camera/CanvasLayer/W.visible = false
			$Camera/CanvasLayer/Right/A.visible = false
			$Camera/CanvasLayer/Right/D.visible = false
			$Camera/CanvasLayer/Setas.visible = false
			$Camera/CanvasLayer/Reset.visible = true
		_:
			$Camera/CanvasLayer/Label.visible = false
			$Camera/CanvasLayer/Right.visible = false
			$Camera/CanvasLayer/Left.visible = false
			$Camera/CanvasLayer/Up.visible = false
			$Camera/CanvasLayer/W.visible = false
			$Camera/CanvasLayer/Right/A.visible = false
			$Camera/CanvasLayer/Right/D.visible = false
			$Camera/CanvasLayer/Setas.visible = false
			$Camera/CanvasLayer/Reset.visible = false
			

func _process(_delta):
	# Checa se está no Tutorial para as teclas aparecerem caso esteja, e desaparecer caso não
	match get_tree().current_scene.name:
		"Tutorial":
			if global.pop == false:
				if Input.is_action_pressed("move_left"):
					global.z = true

				if Input.is_action_pressed('move_right'):
					global.p = true

				if global.z == false or global.p == false:
					
					$Camera/CanvasLayer/Label.text = ('Mova-se para os lados usando as setas de navegacao:')
					$Camera/CanvasLayer/Up.visible = false
					$Camera/CanvasLayer/W.visible = false
					
				elif(global.z == true and global.p == true):
					$Camera/CanvasLayer/Label.text = ('Pule pressionando a seta para cima, W ou spacebar:')
					$Camera/CanvasLayer/Right.visible = false
					$Camera/CanvasLayer/Left.visible = false
					$Camera/CanvasLayer/Up.visible = true
					$Camera/CanvasLayer/W.visible = true
					if Input.is_action_just_pressed("jump"):
						global.q = true
						global.j = true

				if global.q == true:

					$Camera/CanvasLayer/W.visible = false
					$Camera/CanvasLayer/Up.visible = false
					$Camera/CanvasLayer/Label.text = ('Muito bem! agora dirija-se ao portal\nseguindo as setas')
				
			else:
				global.z = false
				global.p = false
				$Camera/CanvasLayer/Label.visible = false
				$Camera/CanvasLayer/Right.visible = false
				$Camera/CanvasLayer/Left.visible = false
				$Camera/CanvasLayer/Up.visible = false
				$Camera/CanvasLayer/W.visible = false


func _physics_process(_delta: float) -> void:
	match get_tree().current_scene.name: # Analisa quais cenas devem receber física e quais não devem.
		"Hub":
			var _direction: = get_non_physics_direction()
			_velocity = calculate_non_physics_move_velocity(_direction, SPEED)
			_velocity = move_and_slide(_velocity)
		"Level02":
			var _direction: = get_non_physics_direction()
			_velocity = calculate_non_physics_move_velocity(_direction, SPEED)
			_velocity = move_and_slide(_velocity/2)

			#empurrar rigid body
			get_non_physics_direction()
			_velocity = move_and_slide(_velocity, Vector2.ZERO, false,
					4, PI/4, false)
			for index in get_slide_count():
				var collision = get_slide_collision(index)
				if collision.collider.is_in_group("bodies"):
#				var cpos = collision.collider.to_local(collision.position)
					collision.collider.apply_central_impulse(-collision.normal * push)
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


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$SoundJump.play()
		

func _on_Morrer_body_entered(_body: Node) -> void:
	$Camera/CanvasLayer/Label3.text = ('0/4')
	get_tree().reload_current_scene()


func _on_Reset_pressed() -> void:
	global.pronto = [false, false, false]
	get_tree().reload_current_scene()
