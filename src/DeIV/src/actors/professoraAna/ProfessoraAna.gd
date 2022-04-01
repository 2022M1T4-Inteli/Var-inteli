extends ProfessorBase

var held = false

func _ready():
	if get_tree().current_scene.name == ('level03'):
		var dialog = Dialogic.start('timeline-8')
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)
		global.anafase3 = true

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
					if global.hardware == [true, true, true, true]:
						get_tree().paused = true
						var dialog = Dialogic.start('timeline-6')
						dialog.pause_mode = Node.PAUSE_MODE_PROCESS
						dialog.connect('timeline_end', self, 'unpause')
						add_child(dialog)
						global.portal = true
					else:
						get_tree().paused = true
						var dialog = Dialogic.start('timeline-5')
						dialog.pause_mode = Node.PAUSE_MODE_PROCESS
						dialog.connect('timeline_end', self, 'unpause')
						add_child(dialog)
				"level02":
						get_tree().paused = true
						var dialog = Dialogic.start('timeline-3')
						dialog.pause_mode = Node.PAUSE_MODE_PROCESS
						dialog.connect('timeline_end', self, 'unpause')
						add_child(dialog)
				"Level04":
					get_tree().paused = true
					var dialog = Dialogic.start('timeline-1')
					dialog.pause_mode = Node.PAUSE_MODE_PROCESS
					dialog.connect('timeline_end', self, 'unpause')
					add_child(dialog)
					global.npc_level04_done = true
