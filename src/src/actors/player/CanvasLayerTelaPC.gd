extends CanvasLayer

var right = false
var left = false
var up = false



func _on_Left_pressed():
	$telaPC.text += "Esquerda\n"


func _on_Jump_pressed():
	$telaPC.text += "Pular\n" 


func _on_Right_pressed():
	$telaPC.text += "Direita\n"


func _on_Clear_pressed():
	$telaPC.text = ""
	global.count = 0
	global.enable = true
