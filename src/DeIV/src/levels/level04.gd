extends Node2D


var errors = 0


func _ready() -> void:
	$Right.visible = false
	$Up.visible = false
	$Left.visible = false
	

func _process(_delta):
	if global.buttonstart == true:
		$level04Menu/ButtonPlay.disabled = false
	if errors == 3:
		get_tree().change_scene("res://src/Levels/level04.tscn")
		global.level04_pontos = 0
		errors = 0
		

func _on_ButtonPlay_pressed() -> void:
	if global.npc_level04_done:
		randomizer()
	if global.startfase4 == true:
		$level04Menu/ButtonLeft.visible = true
		$level04Menu/ButtonRight.visible = true
		$level04Menu/ButtonPlay.visible = false
		$level04Menu/ButtonJump.visible = true


func _on_ButtonLeft_pressed() -> void:
	if global.random == 1:
		$Left.visible = false
		global.level04_pontos += 1
		global.LEFT = true
		randomizer()
	else:
		errors += 1
		$telaPC.text = str("Numero de erros: ", errors)
		

func _on_ButtonRight_pressed() -> void:
	if global.random == 2:
		$Right.visible = false
		global.level04_pontos += 1
		global.RIGHT = true
		randomizer()
	else:
		errors += 1
		$telaPC.text = str("Numero de erros: ", errors)


func _on_ButtonJump_pressed() -> void:
	if global.random == 3:
		$Up.visible = false
		global.level04_pontos += 1
		global.UP = true
		randomizer()
	else:
		errors += 1
		$telaPC.text = str("Numero de erros: ", errors)
		

# Utilizar seed para criar um verdadeiro RNG


func randomizer():
	global.random = randi() % 3 + 1
	match global.random:
		1:
			$Left.visible = true
		2:
			$Right.visible = true
		3:
			$Up.visible = true
