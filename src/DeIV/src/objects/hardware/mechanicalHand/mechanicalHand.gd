extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _on_body_entered(_body: PhysicsBody2D) -> void:
	global.hardware[2] = true
	$SoundHardwareCollected.play()
	anim_player.play("fade_out")
