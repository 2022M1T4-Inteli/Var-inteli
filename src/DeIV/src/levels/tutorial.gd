extends Node2D

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if global.q == true:
		$TileMap3.visible = true
	if global.j == false:
		$Portal.visible = false
		$Portal.monitorable = false
		$Portal.monitoring = false
	else:
		$Portal.monitoring = true
		$Portal.visible = true
		$Portal.monitorable = true
		$Seta.visible = true
		$Seta2.visible = true
		$Seta3.visible = true
		$Seta4.visible = true
		$TileMap4.collision_mask = false
		$TileMap3.visible = true
		$TileMap4.visible = false
		
