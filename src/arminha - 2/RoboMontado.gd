extends Area2D

var active = false
var teleporte = false

func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_entered", self, 'alo')
	connect("body_exited", self, '_on_NPC_body_exited')

func _input(event):
	if get_node_or_null('DialogNode') == null: # Vê se já tem outra caixa de diálogo em aberto
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true # Pausa tudo
			Dialogic.set_variable("pontos", Global.score)
			var dialog = Dialogic.start('timeline-2')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			dialog.connect('dialogic_signal', self, 'ez')
			add_child(dialog)

func ez(algo):
	if algo == 'vai':
		teleporte = true
		print("varzea")
		
func alo(body):
	if body.name == 'Player':
		pass
	
func unpause(timeline_name):
	get_tree().paused = false # Despausa 	

func sla(body):
	Input.is_action_just_released("ui_accept")

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
			
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
		if teleporte == true:
			body.position.y = 608
			body.position.x = 104
			teleporte = false

func _process(delta):
	$TextBox.visible = active
