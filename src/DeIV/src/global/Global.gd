extends Node

var hardware = [false, false, false, false]
var z = false
var p = false
var q = false
var g = false
var j = false
var pop = false
var portal = false
var npc_level04_done = false
var pronto = [false,false,false]
var count = 0
var enable = false
var anafase3 = false
var setaslv1 = 0
var go = false
var contagem = 0
var portalhub = false

func _ready():
	OS.window_fullscreen = true # Deixa o jogo em tela cheia


# Termina o jogo caso ESC seja pressionado
func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
