extends Button


func _on_pressed() -> void:
	if global.npc_level04_done:
		 hide()
		 global.play = true
