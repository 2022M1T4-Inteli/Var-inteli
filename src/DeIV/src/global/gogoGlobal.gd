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
var pontosfase04 = 0
var buttonstart = false
var LEFT = false
var RIGHT = false
var UP = false
var startfase4 = false
var random = false
var play = false
var level04_pontos = 0


func _ready():
	randomize()
	OS.window_fullscreen = true # Deixa o jogo em tela cheia


# Termina o jogo caso ESC seja pressionado
func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
