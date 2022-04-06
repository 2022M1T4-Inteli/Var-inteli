extends Node2D


func _process(delta):
	if global.pronto == [true,true,true]:
		$Portal3.visible = true
		$Portal3.monitoring = true
		$Portal3.monitorable = true
func _on_coracao_body_entered(body):
	global.pronto[0] = true



func _on_bracoesquerdo_body_entered(body):
	global.pronto[1] = true


func _on_bracodireito_body_entered(body):
	global.pronto[2] = true
