extends Node2D


# Painel começa desativado.
func _ready():
	$playerButtonNode/CanvasLayer/Clear.visible = false
	$playerButtonNode/CanvasPanel/Panel/Jump.visible = false
	$playerButtonNode/CanvasPanel/Panel/Left.visible = false
	$playerButtonNode/CanvasPanel/Panel/Right.visible = false


# Painel ativado depois da fala do NPC, utilizado para desviar bugs.
func _process(_delta):
	if global.anafase3 == true:
		$playerButtonNode/CanvasPanel/Panel.visible = true
		$playerButtonNode/CanvasLayer/painelControle.visible = true
		$playerButtonNode/CanvasLayer/telaPC.visible = true
		$playerButtonNode/CanvasLayer/Clear.visible = true
		$playerButtonNode/CanvasPanel/Panel/Left.visible = true
		$playerButtonNode/CanvasPanel/Panel/Jump.visible = true
		$playerButtonNode/CanvasPanel/Panel/Right.visible = true


func _on_chegada_body_entered(_body):
	$Portal4.visible = true
	$Portal4.monitorable = true
	$Portal4.monitoring = true


func _on_Area2D_body_entered(_body):
	if global.pontosfase04 == 4:
		get_tree().change_scene("res://src/levels/level04.tscn")
	
