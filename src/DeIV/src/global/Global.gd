extends Node

var hardware = [false, false, false, false]


func _ready():
	OS.window_fullscreen = true # Deixa o jogo em tela cheia


# Termina o jogo caso ESC seja pressionado
func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
