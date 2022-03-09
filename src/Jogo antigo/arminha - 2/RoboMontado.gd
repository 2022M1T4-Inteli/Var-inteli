extends Area2D

var active = false
var teleporte = false

# Chama uma função caso um corpo entre
func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_entered", self, 'alo')
	connect("body_exited", self, '_on_NPC_body_exited')

# Cria um diálogo com o player
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			Dialogic.set_variable("pontos", Global.score)
			var dialog = Dialogic.start('timeline-2')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			dialog.connect('dialogic_signal', self, 'ez')
			add_child(dialog)

# Ativa a habilidade de teletransportar o usuário
func ez(algo):
	if algo == 'vai':
		teleporte = true
	
func unpause(timeline_name):
	get_tree().paused = false # Despausa 	

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
			
func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false
		if teleporte == true: # Teleporta o jogador caso ele colete as 3 peças
			body.position.y = 608
			body.position.x = 104
			teleporte = false

func _process(delta):
	$TextBox.visible = active
