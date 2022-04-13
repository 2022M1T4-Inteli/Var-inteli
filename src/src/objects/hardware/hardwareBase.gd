extends Node
class_name HardwareBase

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")


func _ready() -> void:
	connect("body_entered", self, '_on_body_entered')
	

func _on_body_entered(_body: PhysicsBody2D) -> void:
	$SoundHardwareCollected.play()
	anim_player.play("fade_out")	
