extends Area2D
class_name ProfessorBase

var active = false


func _ready():
	connect("body_entered", self, '_on_body_entered')
	connect("body_exited", self, '_on_body_exited')
	
	
func _process(_delta):
	$Sprite2.visible = active


func unpause(_timeline_name):
	get_tree().paused = false
	
			
func _on_body_entered(_body):
	active = true
		
		
func _on_body_exited(_body):
	active = false
