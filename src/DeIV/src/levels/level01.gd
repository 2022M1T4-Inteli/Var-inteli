extends Node2D

var dialogo1 = false


func _process(delta):
	$Player/Camera/CanvasLayer/Label3.visible = true
	$Portal.monitoring = false
	$Portal.monitorable = false
	$Portal.visible = false
#	if global.portalhub == true:
#
#	if Input.is_action_just_pressed("ui_down"):
#		global.hardware = [true,true,true,true]
	if global.portal == true:
#	if global.hardware == [true,true,true,true]:
		$Portal2.monitoring = true
		$Portal2.monitorable = true
		$Portal2.visible = true
	if global.contagem == 0:
		$Player/Camera/CanvasLayer/Label3.text = ('0/4')
	elif global.contagem == 1:
		$Player/Camera/CanvasLayer/Label3.text = ('1/4')
	elif global.contagem == 2:
		$Player/Camera/CanvasLayer/Label3.text = ('2/4')
	elif global.contagem == 3:
		$Player/Camera/CanvasLayer/Label3.text = ('3/4')
	elif global.contagem == 4: 
		$Player/Camera/CanvasLayer/Label3.text = ('4/4')
		$Player/Camera/CanvasLayer/Label2.visible = true
		$Player/Camera/CanvasLayer/Label2.text = ('Você coletou todas as peças! Agora dirija-se à professora Ana novamente')
#	else:
#		$Player/Camera/CanvasLayer/Label2.visible = false
	if global.go == true:
		$Player/Camera/CanvasLayer/Label3.visible = true
	if global.hardware != [true,true,true,true]:
		$SetaVolta.visible = false
	else:
		$SetasIda.visible = false
		$SetaVolta.visible = true
	
func unpause(_timeline_name):
	get_tree().paused = false


func _on_Morrer_body_entered(body: Node) -> void:
	global.contagem = 0
	$Player/Camera/CanvasLayer/Label3.text = ('0/4')
