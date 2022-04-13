extends Node2D


var errors = 0


# Portal e setas começam desativadas.
func _ready() -> void:
	$Right.visible = false
	$Up.visible = false
	$Left.visible = false
	$Area2D.monitoring = false
	$Area2D.visible = false
	

# Condições de caso o jogador perca ou ganhe.
func _process(_delta):
	if global.buttonstart == true:
		$level04Menu/ButtonPlay.disabled = false
	if errors == 3:
		get_tree().reload_current_scene()
		global.level04_pontos = 0
		errors = 0
	if global.level04_pontos == 10:
		$Area2D.monitoring = true
		$Area2D.visible = true
		
		
# Botão de play que inicia o mini-game
func _on_ButtonPlay_pressed() -> void:
	if global.npc_level04_done:
		randomizer()
	if global.startfase4 == true:
		$level04Menu/ButtonLeft.visible = true
		$level04Menu/ButtonRight.visible = true
		$level04Menu/ButtonPlay.visible = false
		$level04Menu/ButtonJump.visible = true


# Botões que movimentam o robô e somam pontos
func _on_ButtonLeft_pressed() -> void:
	if global.random == 1:
		$Left.visible = false
		global.level04_pontos += 1
		global.LEFT = true
		randomizer()
		$SoundCorrect.play()
		$Acertos.text = str("Testes corretos: ", global.level04_pontos)
	else:
		errors += 1
		$telaPC.text = str("Numero de erros: ", errors)
		$SoundError.play()
		

func _on_ButtonRight_pressed() -> void:
	if global.random == 2:
		$Right.visible = false
		global.level04_pontos += 1
		global.RIGHT = true
		randomizer()
		$SoundCorrect.play()
		$Acertos.text = str("Testes corretos: ", global.level04_pontos)
	else:
		errors += 1
		$telaPC.text = str("Numero de erros: ", errors)
		$SoundError.play()


func _on_ButtonJump_pressed() -> void:
	if global.random == 3:
		$Up.visible = false
		global.level04_pontos += 1
		global.UP = true
		randomizer()
		$SoundCorrect.play()
		$Acertos.text = str("Testes corretos: ", global.level04_pontos)
	else:
		errors += 1
		$telaPC.text = str("Numero de erros: ", errors)
		$SoundError.play()


# Gera um número aleatório que indica qual seta aparecerá
func randomizer():
	global.random = randi() % 3 + 1
	match global.random:
		1:
			$Left.visible = true
		2:
			$Right.visible = true
		3:
			$Up.visible = true


func _on_Area2D_body_entered(_body: Node) -> void:
	get_tree().change_scene("res://src/levels/panel.tscn")
