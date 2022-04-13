extends KinematicBody2D

var _velocity = Vector2()
var speed = 50
var moving_left = true
const gravity = 32
const up = Vector2.UP

onready var RayWall = $RayWall


func _physics_process(_delta):
#Colisor para que se o inimigo bater no tilemap, voltar para direita e vice-versa
	if RayWall.is_colliding():
		moving_left = !moving_left
		RayWall.scale.x = -RayWall.scale.x
	#Movimento para esquerda
	moveleft()

#Função para dar movimento ao personagem
func moveleft():
	#Ajustar gravidade, pois o mapa é de plataforma
	_velocity.y += gravity
	#Indica que o corpo está indo para esquerda inicialmente
	_velocity.x = -speed if moving_left else speed
	#Dar o movimento
	_velocity = move_and_slide(_velocity, up)


#Colisão na cabeça que mata o personagem
func _on_killbox_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
		global.pontosfase04 += 1

