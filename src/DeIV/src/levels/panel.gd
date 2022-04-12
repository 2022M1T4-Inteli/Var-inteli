extends Node2D


func _process(_delta):
	if global.finalfase4 == true:
		$Portal.visible = true
		$Portal.monitorable = true
		$Portal.monitoring = true
