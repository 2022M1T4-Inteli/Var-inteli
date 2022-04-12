extends KinematicBody2D

var left = false
var right = false
var up = false
var contagem = 0
var velocity = Vector2.ZERO

# Criadas para realizar movimentação e aplicação da gravidade na fase.
const jumpForce = -1000
const speed = 10000
const UPUP = Vector2.UP


# Aplicação da gravidade, que seria o vetor + 30
func _process(_delta):
	velocity.y = velocity.y + 30
	velocity = move_and_slide(velocity)
# Função botão esquerdo
func _on_Left_pressed():
	# O vetor 2 irá receber o movimento através do speed.
	velocity.x = -speed
	# Função para executar o movimento
	velocity = move_and_slide(velocity)
	#Zerar o vetor após pressionar o botão para não interferir outros botões.
	velocity = Vector2.ZERO
	global.count += 1


#Função botão direito
func _on_Right_pressed():
	# Seguir mesmas funcionalidades do botão esquerda, alterando a direção para positiva
	velocity.x = speed
	velocity = move_and_slide(velocity)
	velocity = Vector2.ZERO
	global.count += 1
# Função botão pular
func _on_Jump_pressed():
	# Para ativar o pulo, coloca-se uma força oposta em y
	velocity.y = jumpForce
	# Ativar a movimentação para cima, ele zera sozinho quando tocar no chão por causa da gravidade
	velocity = move_and_slide(velocity, Vector2.UP)
	global.count += 1
