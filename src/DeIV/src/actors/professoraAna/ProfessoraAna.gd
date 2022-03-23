extends ProfessorBase

var held = false


func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			match get_tree().current_scene.name:
				"Hub":
					get_tree().paused = true
					var dialog = Dialogic.start('timeline-2')
					dialog.pause_mode = Node.PAUSE_MODE_PROCESS
					dialog.connect('timeline_end', self, 'unpause')
					add_child(dialog)
				"Level01":
					if Global.hardware == [1, 1, 1, 1]:
						get_tree().paused = true
						var dialog = Dialogic.start('timeline-6')
						dialog.pause_mode = Node.PAUSE_MODE_PROCESS
						dialog.connect('timeline_end', self, 'unpause')
						add_child(dialog)
					else:
						get_tree().paused = true
						var dialog = Dialogic.start('timeline-5')
						dialog.pause_mode = Node.PAUSE_MODE_PROCESS
						dialog.connect('timeline_end', self, 'unpause')
						add_child(dialog)
