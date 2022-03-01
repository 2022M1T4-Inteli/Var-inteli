extends Area2D

var active = false
var placeholder = 1
onready var timer = get_node("Timer")

func _ready():
	connect("body_entered", self, '_on_Caixa_body_entered')
	connect("body_exited", self, '_on_Caixa_body_exited')
	$Sprite2.visible = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and placeholder == 1 and active:
		placeholder = 0
		Global.score += 1
		$Sprite2.visible = true
		startTimer()
			
func startTimer():
	timer.set_wait_time(2)
	timer.start()

func _on_Timer_timeout():
	queue_free()

# Ativa o NPC caso o corpo que está a passar seja o player
func _on_Caixa_body_entered(body):
	if body.name == 'Player':
		active = true
				
# Desativa o NPC caso o player saia de perto	
func _on_Caixa_body_exited(body):
	if body.name == 'Player':
		active = false
