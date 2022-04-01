extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if global.portal == true:
#	if global.hardware == [true,true,true,true]:
		$Portal2.monitoring = true
		$Portal2.monitorable = true
		$Portal2.visible = true
