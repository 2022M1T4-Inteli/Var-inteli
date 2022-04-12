extends Node2D


# Ativa o portal para a próxima fase caso todas as caixas já estiverem em seus respectivos lugares
func _process(_delta):
	if global.pronto == [true,true,true]:
		$Portal3.visible = true
		$Portal3.monitoring = true
		$Portal3.monitorable = true
		
		
# Funções que checam se o corpo entrado nas áreas são caixas		
func _on_coracao_body_entered(body):
	if body is RigidBody2D:
		global.pronto[0] = true
		$AudioConfirmed.play()


func _on_bracoesquerdo_body_entered(body):
	if body is RigidBody2D:
		global.pronto[1] = true
		$AudioConfirmed.play()


func _on_bracodireito_body_entered(body):
	if body is RigidBody2D:
		global.pronto[2] = true
		$AudioConfirmed.play()
