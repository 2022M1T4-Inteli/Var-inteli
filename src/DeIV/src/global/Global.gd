extends Node

var hardware = [false, false, false, false]
var z = false
var p = false
var q = false
var g = false
var j = false
var pop = false
var npc_level04_done = false


func _ready():
	OS.window_fullscreen = true # Deixa o jogo em tela cheia


# Termina o jogo caso ESC seja pressionado
func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
