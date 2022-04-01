extends Node2D


func _process(delta):
	if global.pronto == true:
		$Portal3.visible = true
		$Portal3.monitoring = true
		$Portal3.monitorable = true
func _on_coracao_body_entered(body):
	global.pronto = true

